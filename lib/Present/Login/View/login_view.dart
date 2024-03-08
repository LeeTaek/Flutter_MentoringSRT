import 'package:flutter/material.dart';
import 'package:flutter_srt/Present/Login/ViewModel/login_view_model.dart';
import 'package:flutter_srt/injection.dart';


class LoginView extends StatelessWidget { 
  const LoginView({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
  String? code = "1234";
  final viewModel = getIt<LoginViewModel>();

  return Scaffold(
    appBar:  AppBar(title: const Text('Login')),
    body: Center(
      child: OutlinedButton( 
        onPressed: () async { 
          await viewModel.veirify(code); 
          },
        child: const Text("test"),
      ),
    )
  );
  }
}