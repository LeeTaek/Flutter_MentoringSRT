import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_srt/Present/Components/dialog_page.dart';
import 'package:flutter_srt/Present/Components/popup_page.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/View/login_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/ViewModel/login_view_model.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Signup/View/signup_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Signup/ViewModel/signup_view_model.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Verify/View/signup_verify_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Verify/ViewModel/signup_verify_view_model.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/View/home_view.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/ViewModel/home_view_model.dart';
import 'package:flutter_srt/Present/TicketingFlow/PushList/View/push_list_view.dart';
import 'package:flutter_srt/Present/TicketingFlow/PushList/ViewModel/push_list_view_model.dart';
import 'package:flutter_srt/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@singleton
class Router {
  final bool loginState;

  Router( 
    this.loginState
  );

  GoRoute loginRoute(List<GoRoute> routes) {
    return GoRoute(
      path: '/login', 
      name: 'login',
      builder:(context, state) {
        final viewModel = getIt<LoginViewModel>();
        return ChangeNotifierProvider(
          create: (context) => viewModel,
          child: const LoginView()
          );
      }, 
      routes: routes
    ) ;
  }

  GoRoute signupVerifyRoute(List<GoRoute> routes) {
    return GoRoute(
      path: '/login_signup_verify',
      name:'signup_verify',
      builder:(context, state) {
        final viewModel = getIt<SignupVerifyViewModel>();
        return ChangeNotifierProvider(
          create: (context) => viewModel,
          child: const SignupVerifyView()
          );
      },
      routes: routes
    );
  }

  GoRoute signupRoute(List<GoRoute> routes) { 
    return GoRoute(
      path: '/login_signup/:email',
      name:'signup',
      builder:(context, state) {
        final viewModel = getIt<SignupViewModel>();
        viewModel.idTextEditingController.text = state.pathParameters["email"]!;
        return ChangeNotifierProvider(
          create: (context) => viewModel,
          child: const SignupView()
          );
      },
      routes: routes
    );
  }

  GoRoute ticketingHome(List<GoRoute> routes) {
  return GoRoute(
    path: '/ticketing/home',
    name: 'home',
    builder: (context, state) {
      return FutureBuilder<HomeViewModel>(
        future: getIt.getAsync<HomeViewModel>(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); 
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); 
          } else {
            return ChangeNotifierProvider<HomeViewModel>.value(
              value: snapshot.data!,
              child: const HomeView(),
            );
          }
        },
      );
    },
    routes: routes,
  );
}

  final GoRoute dialogRoute = GoRoute( 
    path: 'dialog/:description', 
    pageBuilder: (BuildContext context, GoRouterState state) { 
      return CupertinoDialogPage(builder: (_) => PopupPage(description: state.pathParameters["description"]!));
    }
  );

  final GoRoute pushListRoute = GoRoute(
    path: 'pushList',
    name: 'pushList', 
    builder: (context, state) { 
      final viewModel = getIt<PushListViewModel>(); 
      return ChangeNotifierProvider(
        create: (context) => viewModel, 
        child: const PushListView()
        );
      }
    );

  late final routerConfig = GoRouter(
    routes: [
      loginRoute([dialogRoute,]), 
      signupVerifyRoute([dialogRoute,]),
      signupRoute([dialogRoute, ]),
      ticketingHome([dialogRoute, pushListRoute])
    ],
    debugLogDiagnostics: true,  
    redirect: (context, state) {
      final bool isLoginPath = state.fullPath?.contains('/login') ?? false;
      final bool isDialogPath = state.matchedLocation.contains('dialog') ;
      final bool ticketing = state.fullPath?.contains('/ticketing') ?? false;

      if (loginState || isLoginPath || isDialogPath || ticketing) { 
        return null;
      } else { 
        // return '/login';
        return '/ticketing/home';
      }
    },
  );

}