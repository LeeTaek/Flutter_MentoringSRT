import 'package:flutter/material.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel with ChangeNotifier { 
  late final LoginUseCase _loginUseCase;
  String? code;

  LoginViewModel(this._loginUseCase); 

Future<void> veirify(String code) async { 
  this.code = await _loginUseCase.getVerify(code);
  debugPrint(this.code);
  notifyListeners();
}

}