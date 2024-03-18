import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:flutter_srt/Present/Coordinator/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable 
class SignupViewModel extends ViewModel with ChangeNotifier { 
  late final LoginUseCase _loginUseCase;
  String? eamil;
  SignupViewModel(this._loginUseCase) : super(); 

  void popToLoginView(BuildContext context) { 
    coordinator.pop(context);
  }


  Future<void> veirify(String code) async { 
   final verifyResult = await _loginUseCase.getVerify(code);
   debugPrint(verifyResult);
   notifyListeners();
  }

}