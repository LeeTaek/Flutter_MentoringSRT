import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@injectable 
class SignupVerifyViewModel with ChangeNotifier { 
  late final LoginUseCase _loginUseCase;
  final idTextEditingController = TextEditingController();
  final codeTextEdtingController = TextEditingController();
  final validation = [true, true];
  var isGetVerifyCode = false;
  SignupVerifyViewModel(this._loginUseCase) : super(); 

  void popToLoginView(BuildContext context) { 
    GoRouter.of(context).go('/login');
  }

  void pushToSignupView(BuildContext context, String email) { 
    GoRouter.of(context).push('/login_signup/$email');
  }

  void presentPopup(BuildContext context, String description) { 
    GoRouter.of(context).push('/login_signup_verify/dialog/$description');
  }

  Future<void> getSignupCode(BuildContext context) async { 
    final email = idTextEditingController.text;
    if (!_isValidEamil()) { 
      validation[0] = false;
      notifyListeners();
    } else {
      final getSignupResult = await _loginUseCase.getSignupcode(email);
      if (getSignupResult == 'SUCCESS') { 
        validation[0] = true;
        isGetVerifyCode = true;
        notifyListeners();
      } else if (context.mounted){ 
        presentPopup(context, (getSignupResult ?? ""));
      }
      debugPrint(getSignupResult);
    }
  }

  Future<void> veirify(BuildContext context) async { 
    final code = codeTextEdtingController.text;
    if (code.isEmpty) { 
      debugPrint(code);
    } else {
      final verifyResult = await _loginUseCase.getVerify(code);
      if (verifyResult == 'SUCCESS' && context.mounted) { 
        pushToSignupView(context, idTextEditingController.text);
      } else if (context.mounted){ 
        presentPopup(context, (verifyResult ?? ""));
      }
    }
  }

  bool _isValidEamil() { 
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(idTextEditingController.text);
  }
}