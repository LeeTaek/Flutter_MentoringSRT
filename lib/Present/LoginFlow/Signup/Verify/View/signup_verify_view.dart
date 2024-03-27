import 'package:flutter_srt/Present/Components/navigation_bar.dart';
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
      child: SafeArea(
          child: Column ( 
            children: [
              NavigationBar(
                title: "회원가입", 
                trailingButton: CupertinoButton( 
                  padding: const EdgeInsets.all(0),
                  child: Image.asset('assets/images/navi_close_button.png', width: 24, height: 24,),
                  onPressed: () => viewModel.popToLoginView(context)
                ),
              ),
              Padding( 
                padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 24),
                child: Column( 
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [ 
                    SignupTextField(
                      title: "아이디", 
                      placeholder: "open@object.net",
                      errorMessage: "이메일 형식이 아닙니다.",
                      isValid: viewModel.validation[0],
                      controller: viewModel.idTextEditingController,
                      enabled: !viewModel.isGetVerifyCode 
                    ), 
                    const SizedBox(height: 15),
                    Align( 
                      alignment: Alignment.centerRight,
                      child: SRTButton(
                        width: 150,
                        height: 48,
                        title: "인증하기", 
                        onPressed: () async { 
                          await viewModel.getSignupCode(context);
                        }
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (viewModel.isGetVerifyCode) SignupTextField(
                        title: "인증코드", 
                        placeholder: "인증코드",
                        errorMessage: "",
                        isValid: viewModel.validation[1],
                        controller: viewModel.codeTextEdtingController,
                      ), 
                    const SizedBox(height: 15),
                    if (viewModel.isGetVerifyCode) Align( 
                      alignment: Alignment.centerRight,
                      child: SRTButton(
                        width: 150, 
                        height: 48,
                        title: "Verify", 
                        onPressed: () async { 
                          await viewModel.veirify(context);
                        }
                      ),
                    )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}