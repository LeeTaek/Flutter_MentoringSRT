import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Components/dialog_page.dart';
import 'package:flutter_srt/Present/Components/popup_page.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/View/login_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/ViewModel/login_view_model.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Signup/View/signup_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Signup/ViewModel/signup_view_model.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Verify/View/signup_verify_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Verify/ViewModel/signup_verify_view_model.dart';
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

  final GoRoute loginRoute = GoRoute(
    path: '/login', 
    name: 'login',
    builder:(context, state) {
      final viewModel = getIt<LoginViewModel>();
      return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: const LoginView()
        );
    }, 
  ) ;

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
    path: '/login_signup',
    name:'signup',
    builder:(context, state) {
      final viewModel = getIt<SignupViewModel>();
      return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: const SignupView()
        );
    },
    routes: routes
  );
 }

  final GoRoute dialogRoute = GoRoute( 
    path: 'dialog/:description', 
    pageBuilder: (BuildContext context, GoRouterState state) { 
      return CupertinoDialogPage(builder: (_) => PopupPage(description: state.pathParameters["description"]!));
    }
  );



  late final routerConfig = GoRouter(
    routes: [
      loginRoute, 
      signupVerifyRoute([dialogRoute,]),
      signupRoute([dialogRoute, ]),
    ],
    debugLogDiagnostics: true,  
    redirect: (context, state) {
      final bool isLoginPath = state.fullPath?.contains('/login') ?? false;
      final bool isDialogPath = state.matchedLocation.contains('dialog') ;

      if (loginState || isLoginPath || isDialogPath) { 
        return null;
      } else { 
        return '/login';
      }
    },
  );

}