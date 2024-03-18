import 'package:flutter_srt/Present/LoginFlow/Login/View/login_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/ViewModel/login_view_model.dart';
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

  final GoRoute signupRoute = GoRoute(
    path: '/login_signup_verify',
    name:'signup_veritfy',
    builder:(context, state) {
      final viewModel = getIt<SignupVerifyViewModel>();
      return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: const SignupVerifyView()
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