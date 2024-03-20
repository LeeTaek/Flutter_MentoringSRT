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
    validation[0] = isValidEamil();
    validation[2] = isValidBrith();
    validation[3] = isValidPW();
    validation[4] = isValidPW();
    notifyListeners();

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
        debugPrint("success $signupResult");
        popToLoginView(context);
      } else { 
        debugPrint("fail $signupResult");
      }
    } else { 
      debugPrint("validation fali: $validation");
    }
  }

  bool isValidEamil() { 
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(idTextEditingController.text);
  }

  bool isValidBrith() { 
    final birthRegex = RegExp(r'^\d{6}$');
    return birthRegex.hasMatch(brithTextEditingController.text);
  }

  bool isValidPW() { 
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (pwTextEditingController.text == rePwTextEditingController.text) { 
      return passwordRegex.hasMatch(pwTextEditingController.text);
    } else { 
      return false;
    }
  }

  String _convertYear(String date) { 
    int year = int.tryParse(date.substring(0, 2)) ?? 0;
    return (year <= 40) ? '20$date' : '19$date';
  }

}