import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Coordinator/coordinator.dart';
import 'package:flutter_srt/Present/Coordinator/project_navigator.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/View/login_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/ViewModel/login_view_model.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Coordinator/signup_coordinator.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/View/signup_view.dart';
import 'package:flutter_srt/injection.dart';
import 'package:provider/provider.dart';

class LoginCoordinator extends Coordinator { 
  LoginCoordinator() : 
  super( Dependency<LoginView>(
      naviStack: [],
      parentCoordinator: null,
      widget: const LoginView()
    )
  );

  @override 
  void end() { 
  }

  @override 
  void pop(BuildContext context) { 
    
  }

  @override 
  Widget start() { 
    final viewModel = getIt<LoginViewModel>();
    viewModel.coordinator = this;
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: dependency.widget,
      );
  }

  /// Siggnup으로 이동
  @override 
  Widget move(NavigationIdentifier to, BuildContext context) {
    final signupDependency = Dependency<SignupView>(
      naviStack: dependency.naviStack,
      parentCoordinator: this,
      widget: const SignupView(),
    );
    final childCoordinator = SignupCoordinator(signupDependency);
    final view = childCoordinator.start();
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => view));
    return view;
  }
}