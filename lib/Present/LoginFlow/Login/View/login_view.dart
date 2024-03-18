import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              onTextChanged: (id, password) {
                viewModel.id = id;
                viewModel.password = password;
              },
            ),
            const SizedBox(height: 11),
            SRTButton(
              width: double.infinity,
              height: 48,
              title: "로그인",
              onPressed: () async {
                 await viewModel.login();
                } 
            ),
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
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 102, 102),
                    decoration: TextDecoration.underline,
                    fontSize: 17.0,
                    ), 
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
  const LoginTextField({Key? key, required this.onTextChanged}) : super(key: key);

  final void Function(String id, String password) onTextChanged; 

  @override 
  LoginTextFieldState createState() => LoginTextFieldState();
}

class LoginTextFieldState extends State<LoginTextField> { 
  final _idTextEditController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override 
  Widget build(BuildContext context) { 
    var idTextField = SizedBox( 
        height: 62,
        child: CupertinoTextField(
        controller: _idTextEditController,
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
          widget.onTextChanged(text, _passwordTextEditingController.text);
        },
      ),
    );

   var pwTextField = SizedBox( 
      height: 62, 
      child: CupertinoTextField(
        controller: _passwordTextEditingController,
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
          widget.onTextChanged(_idTextEditController.text, text);
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
    _idTextEditController.dispose();
    _passwordTextEditingController.dispose();
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
          const Text(
            "아이디 저장",
            style: TextStyle(
              color: Color.fromARGB(255, 136, 136, 136),
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
