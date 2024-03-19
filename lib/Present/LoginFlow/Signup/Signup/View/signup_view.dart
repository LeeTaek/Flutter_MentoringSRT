import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Components/navigation_bar.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Signup/ViewModel/signup_view_model.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget { 
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    final viewModel = Provider.of<SignupViewModel>(context);
    return CupertinoPageScaffold(
      child: SafeArea( 
        child: Column( 
          children: [
              NavigationBar(
                title: "회원가입", 
                trailingButton: CupertinoButton( 
                  child: Image.asset('assets/images/navi_close_button.png', width: 24, height: 24,),
                  onPressed: () => viewModel.popToLoginView(context)
                ),
              ),
              Padding( 
                padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 24),
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [ 
                    
                  ]
                )
              )
          ],
        )
      ),
    );
  }

}