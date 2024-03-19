import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@injectable 
class SignupVerifyViewModel with ChangeNotifier { 
  late final LoginUseCase _loginUseCase;
  final idTextEditingController = TextEditingController();
  final codeTextEdtingController = TextEditingController();
  SignupVerifyViewModel(this._loginUseCase) : super(); 

  void popToLoginView(BuildContext context) { 
    GoRouter.of(context).go('/login');
  }

  void pushToSignupView(BuildContext context) { 
    GoRouter.of(context).push('/login_signup');
  }


  Future<void> getSignupCode() async { 
    final email = idTextEditingController.text;
    if (email.isEmpty) { 
      debugPrint("Empty Textfield");
    } else {
      final getSignupResult = await _loginUseCase.getSignupcode(email);
      if (getSignupResult == 'SUCCESS') { 
        
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
        pushToSignupView(context);
      } 
    }
  }

}