import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@injectable 
class SignupViewModel with ChangeNotifier { 
  late final LoginUseCase _loginUseCase;
  String? eamil;
  SignupViewModel(this._loginUseCase) : super(); 

  void popToLoginView(BuildContext context) { 
    GoRouter.of(context).go('/login');
  }


  Future<void> veirify(String code) async { 
   final verifyResult = await _loginUseCase.getVerify(code);
   debugPrint(verifyResult);
   notifyListeners();
  }

}