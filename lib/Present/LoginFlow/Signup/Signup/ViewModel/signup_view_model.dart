import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Data/Model/signup.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:go_router/go_router.dart';

@injectable 
class SignupViewModel with ChangeNotifier { 
  late final LoginUseCase _loginUseCase;
  final idTextEditingController = TextEditingController();
  final nameTextEditingController = TextEditingController();
  final brithTextEditingController = TextEditingController();
  final pwTextEditingController = TextEditingController();
  final rePwTextEditingController = TextEditingController();
  List<bool> validation = [true, true, true ,true, true];

  SignupViewModel(this._loginUseCase) : super(); 

  void popToLoginView(BuildContext context) { 
    GoRouter.of(context).go('/login');
  }

  Future<void> signup(BuildContext context) async { 
    if (validation.reduce((value, element) => value && element)) { 
      final signup = Signup(
        email: idTextEditingController.text,
        pw: pwTextEditingController.text, 
        birth: _convertYear(brithTextEditingController.text), 
        name: nameTextEditingController.text
      );
      debugPrint(signup.birth);
      final signupResult = await _loginUseCase.signup(signup);
      if (signupResult == 'SUCCESS' && context.mounted) { 
        popToLoginView(context);
      } else if (context.mounted) { 
        context.push('/login_signup/${idTextEditingController.text}/dialog/$signupResult');
      }
    } else { 
      debugPrint("validation fali: $validation");
    }
  }

  void isValidBrith() { 
    final birthRegex = RegExp(r'^\d{6}$|^$');
    validation[2] = birthRegex.hasMatch(brithTextEditingController.text);
    notifyListeners();
  }

  void isValidPW() { 
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$|^$');
    validation[3] = passwordRegex.hasMatch(pwTextEditingController.text);
    notifyListeners();
  }

  void isValideRePw() { 
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$|^$');
    if (rePwTextEditingController.text.isEmpty) { 
      validation[4] == true;
    } else if (pwTextEditingController.text == rePwTextEditingController.text) { 
      validation[4] = passwordRegex.hasMatch(pwTextEditingController.text);
    } else { 
      validation[4] = false;
    }
    notifyListeners();
  }

  String _convertYear(String date) { 
    int year = int.tryParse(date.substring(0, 2)) ?? 0;
    return (year <= 40) ? '20$date' : '19$date';
  }

}