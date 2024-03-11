import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:flutter_srt/Present/Coordinator/view_model.dart';
import 'package:injectable/injectable.dart';

@injectable 
class SignupViewModel extends ViewModel with ChangeNotifier { 
  late final LoginUseCase _loginUseCase;

  SignupViewModel(this._loginUseCase) : super(); 

}