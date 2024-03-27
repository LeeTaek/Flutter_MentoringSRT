import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_srt/Present/Components/notosans_text.dart';
import 'package:flutter_srt/Present/Components/srt_button.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/ViewModel/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget { 
  const LoginView({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
  final viewModel = Provider.of<LoginViewModel>(context); // LoginViewModel에 접근
  return CupertinoPageScaffold(
    child: Padding( 
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Padding( 
              padding: const EdgeInsets.only(left: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/openobjectLogo.png', width: 135, height: 22,),
              ),
            ),
            Padding( 
              padding: const EdgeInsets.symmetric(vertical: 97),
              child: Image.asset('assets/images/srtLogo.png', width: 200, height: 49,),
              ), 
            LoginTextField(
              idTextEditingController: viewModel.idTextEditingController,
              pwTextEditingController: viewModel.pwTextEditingController,
              onTextChanged: (id, pw) {
                viewModel.isEnableButton(id, pw);
              },
            ),
            const SizedBox(height: 11),
            SRTButton(
              width: double.infinity,
              height: 48,
              title: "로그인",
              enable: viewModel.isEnableLoginButton,
              onPressed: () async {
                 await viewModel.login(context);
                } 
            ),
            const SizedBox(height: 11),
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SavedIDToggleButton( 
                  value: viewModel.isSavedID,
                  onChanged: (value) {
                    viewModel.toggleSavedID(value);
                  },
                ),
                TextButton(
                onPressed: () {
                  viewModel.moveToSignup(context);
                },
                child: NotoSansText(
                  text: '회원가입',
                  color: const Color.fromARGB(255, 102, 102, 102),
                  decoration: TextDecoration.underline,
                  size: 17.0,
                  ), 
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}

class LoginTextField extends StatefulWidget { 
  final TextEditingController idTextEditingController;
  final TextEditingController pwTextEditingController;
  final void Function(String id, String password) onTextChanged; 

  const LoginTextField({
    Key? key, 
    required this.idTextEditingController,
    required this.pwTextEditingController,
    required this.onTextChanged
  }) : super(key: key);

  @override 
  LoginTextFieldState createState() => LoginTextFieldState();
}

class LoginTextFieldState extends State<LoginTextField> { 
  @override 
  Widget build(BuildContext context) { 
    var idTextField = SizedBox( 
        height: 62,
        child: CupertinoTextField(
        controller: widget.idTextEditingController,
        placeholder: "ID",
        decoration: BoxDecoration( 
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFEEEEEE),
            width: 1,
          ), 
        ),
        onChanged: (text) { 
          widget.onTextChanged(text, widget.pwTextEditingController.text);
        },
      ),
    );

   var pwTextField = SizedBox( 
      height: 62, 
      child: CupertinoTextField(
        controller: widget.pwTextEditingController,
        placeholder: "PW",
        obscureText: true,
        decoration: BoxDecoration( 
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFEEEEEE),
            width: 1,
          ), 
        ),
        onChanged: (text) { 
          widget.onTextChanged(widget.idTextEditingController.text, text);
        },
      ),
    );

    return Column( 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          idTextField, 
          const SizedBox(height: 12,),
          pwTextField,
        ],
      );
  }

  @override 
  void dispose() { 
    widget.idTextEditingController.dispose();
    widget.pwTextEditingController.dispose();
    super.dispose();
  }
}

class SavedIDToggleButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const SavedIDToggleButton({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: value
                ? Image.asset('assets/images/ico_login_checked_y.png', width: 27, height: 27,)
                : Image.asset('assets/images/ico_login_checked_n.png', width: 27, height: 27,),
          ),
          NotoSansText(
            text: "아이디 저장",
            color: const Color.fromARGB(255, 136, 136, 136),
            size: 12.0,
          ),
        ],
      ),
    );
  }
}
