import 'package:flutter_srt/Present/LoginFlow/Signup/ViewModel/signup_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class SignupView extends StatelessWidget { 
  const SignupView({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    final viewModel = Provider.of<SignupViewModel>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        middle: const Text("회원가입"),
        trailing:CupertinoButton( 
          child: Image.asset('assets/images/navi_close_button.png', width: 24, height: 24,),
          onPressed: () => viewModel.popToLoginView(context)
        ),
      ),
      child: const SafeArea(
          child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Text("signup View")
          ],
       ),
     )
    );
  }
}