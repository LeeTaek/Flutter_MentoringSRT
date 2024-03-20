import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Components/navigation_bar.dart';
import 'package:flutter_srt/Present/Components/signup_textfield.dart';
import 'package:flutter_srt/Present/Components/srt_button.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Signup/ViewModel/signup_view_model.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget { 
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    final viewModel = Provider.of<SignupViewModel>(context);
    return CupertinoPageScaffold(
      child: SafeArea( 
        child: Stack (
          fit: StackFit.expand,
          children: [ 
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        SignupTextField(
                          title: "아이디",
                          placeholder: "open1404@openobject.net",
                          errorMessage: "이메일 형식에 맞지 않습니다.",
                          isValid: viewModel.validation[0], 
                          controller: viewModel.idTextEditingController
                        ),
                        const SizedBox(height: 24),
                        SignupTextField(
                            title: "이름",
                            placeholder: "김오픈",
                            errorMessage: "", 
                            isValid: viewModel.validation[1],
                            controller: viewModel.nameTextEditingController
                          ),
                        const SizedBox(height: 24),
                        SignupTextField(
                          title: "생년월일",
                          placeholder: "YYMMDD",
                          errorMessage: "생년월일 형식에 맞지 않습니다.", 
                          isValid: viewModel.validation[2],
                          controller: viewModel.brithTextEditingController,
                          maxLength: 8,
                        ),
                        const SizedBox(height: 24),
                        SignupTextField(
                          title: "비밀번호",
                          placeholder: "영문·숫자 조합 8자리 이상",
                          errorMessage: "비밀번호는 8자리 이상입니다.", 
                          isValid: viewModel.validation[3],
                          controller: viewModel.pwTextEditingController
                        ),
                        const SizedBox(height: 24),
                        SignupTextField(
                          title: "비밀번호 확인",
                          placeholder: "영문·숫자 조합 8자리 이상",
                          errorMessage: "비밀번호가 일치하지 않습니다.", 
                          isValid: viewModel.validation[4],
                          controller: viewModel.rePwTextEditingController
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            ),
            Positioned( 
                left: 24,
                right: 24, 
                bottom: 15, 
                child: SRTButton(
                width: double.infinity,
                height: 49, 
                title: "가입하기", 
                onPressed: () async { 
                  await viewModel.signup(context);
                }
              ),
            )
          ]
        )
      )
    );
  }

}