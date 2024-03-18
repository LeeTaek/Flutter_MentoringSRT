import 'package:flutter_srt/Present/Components/signup_textfield.dart';
import 'package:flutter_srt/Present/Components/srt_button.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Verify/ViewModel/signup_verify_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


class SignupVerifyView extends StatelessWidget { 
  const SignupVerifyView({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    final viewModel = Provider.of<SignupVerifyViewModel>(context);
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
      child: SafeArea(
          child: Padding( 
            padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 24),
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
                SignupTextField(
                  title: "아이디", 
                  placeholder: "open@object.net",
                  isValid: false, 
                  obscureText: false, 
                  errorMessage: "",
                  controller: viewModel.idTextEditingController
                ), 
                const SizedBox(height: 15),
                Align( 
                  alignment: Alignment.centerRight,
                  child: SRTButton(
                    width: 150,
                    height: 48,
                    title: "인증하기", 
                    onPressed: () async { 
                      await viewModel.getSignupCode();
                    }
                  ),
                ),
                const SizedBox(height: 24),
                SignupTextField(
                  title: "인증코드", 
                  placeholder: "인증코드",
                  isValid: false, 
                  obscureText: true, 
                  errorMessage: "",
                  controller: viewModel.codeTextEdtingController,
                ), 
                const SizedBox(height: 15),
                Align( 
                  alignment: Alignment.centerRight,
                  child: SRTButton(
                    width: 150, 
                    height: 48,
                    title: "Verify", 
                    onPressed: () async { 
                      await viewModel.veirify();
                    }
                  ),
                )
             ],
           ),
        )
      )
    );
  }
}