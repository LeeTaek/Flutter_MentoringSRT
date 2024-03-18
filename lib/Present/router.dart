import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/View/login_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/ViewModel/login_view_model.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/View/signup_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/ViewModel/signup_view_model.dart';
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

  final GoRoute signupRoute = GoRoute(
    path: '/login_signup_verify',
    name:'signup_veritfy',
    builder:(context, state) {
      final viewModel = getIt<SignupViewModel>();
      return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: const SignupView()
        );
    },
  );


  late final routerConfig = GoRouter(
    routes: [
      loginRoute, 
      signupRoute,
    ],
    debugLogDiagnostics: true,  
    redirect: (context, state) {
      final bool isLoginPath = state.fullPath?.contains('/login') ?? false;
      if (loginState || isLoginPath) { 
        return null;
      } else { 
        return '/login';
      }
    },
  );

}