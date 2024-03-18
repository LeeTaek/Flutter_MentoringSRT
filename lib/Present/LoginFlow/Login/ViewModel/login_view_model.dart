import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:flutter_srt/Present/Coordinator/project_navigator.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_srt/Present/Coordinator/view_model.dart';

@injectable
class LoginViewModel extends ViewModel with ChangeNotifier { 
  late final LoginUseCase _loginUseCase;
  String? id;
  String? password;
  bool _isSavedID = false;
  bool get isSavedID => _isSavedID;

  LoginViewModel(
    this._loginUseCase
  ) : super(); 


Future<void> login() async { 
  debugPrint("$id, $password");
}

void toggleSavedID(bool value) { 
  debugPrint("$value");
  _isSavedID = value;
  notifyListeners();
}

void moveToSignup(BuildContext context) { 
  coordinator.move(NavigationIdentifiers.none, context);
}

}