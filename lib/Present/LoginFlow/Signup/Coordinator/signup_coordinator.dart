import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Coordinator/coordinator.dart';
import 'package:flutter_srt/Present/Coordinator/project_navigator.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/View/signup_view.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/ViewModel/signup_view_model.dart';
import 'package:flutter_srt/injection.dart';
import 'package:provider/provider.dart';

class SignupCoordinator extends Coordinator { 
  SignupCoordinator(Dependency<SignupView> dependency) : super(dependency);

  
  @override 
  void end() { }

  @override
  Widget start() { 
    final viewModel = getIt<SignupViewModel>();
    viewModel.coordinator = this;
    return ChangeNotifierProvider( 
      create: (context) => viewModel,
      child: dependency.widget,
    );
  }
  
  /// Siggnup으로 이동
  @override 
  Widget move(NavigationIdentifier to, BuildContext context) {

    throw UnimplementedError();
  }  


  void pop(BuildContext context) { 
    Navigator.pop(context);
  }


}