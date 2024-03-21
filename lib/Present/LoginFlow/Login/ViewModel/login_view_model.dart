import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Data/Services/shared_preference_services.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:flutter_srt/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel with ChangeNotifier { 
  late final LoginUseCase _loginUseCase;
  final idTextEditingController = TextEditingController();
  final pwTextEditingController = TextEditingController();
  bool _isSavedID = false;
  bool isEnableLoginButton = false;
  bool get isSavedID => _isSavedID;

  LoginViewModel(
    this._loginUseCase,
  ) : super(); 

  void startTicketingFlow(BuildContext context) { 
   GoRouter.of(context).go('/ticketing/home');
  }

  void presentPopup(BuildContext context, String description) { 
    GoRouter.of(context).push('/login/dialog/$description');
  }

  Future<void> login(BuildContext context) async { 
    if ((idTextEditingController.text.isNotEmpty) && (pwTextEditingController.text.isNotEmpty)) {
      final loginResult = await _loginUseCase.login(idTextEditingController.text, pwTextEditingController.text);
      if (loginResult == 'SUCCESS') { 
        if (_isSavedID) { 
          final sharedService = await getIt.getAsync<SharedPreferenceService>();
          await sharedService.setBool('isSavedID', _isSavedID);
          await sharedService.setString("id", idTextEditingController.text);
        }
        if (context.mounted) { 
          startTicketingFlow(context);
        }
      } else if (context.mounted) { 
        presentPopup(context, loginResult ?? "");
      }
    }
  }

  void isEnableButton(String id, String pw) { 
    isEnableLoginButton = (id.isNotEmpty && pw.isNotEmpty);
    notifyListeners();
  }

  void toggleSavedID(bool value) { 
    _isSavedID = value;
    notifyListeners();
  }

  void moveToSignup(BuildContext context) { 
    GoRouter.of(context).push('/login_signup_verify');
  }


}