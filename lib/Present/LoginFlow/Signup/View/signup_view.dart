import 'package:flutter_srt/Present/LoginFlow/Signup/ViewModel/signup_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class SignupView extends StatelessWidget { 
  const SignupView({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    final viewModel = Provider.of<SignupViewModel>(context);
    return const CupertinoPageScaffold(
      child: Text("Signup")
      );
  }
}