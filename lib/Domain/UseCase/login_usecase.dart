import 'package:flutter_srt/Domain/Repository/login_repository.dart';

class LoginUseCase { 
  final LoginRepository _repository; 

  LoginUseCase(this._repository);

  Future<String> getVerify(String code) async { 
    return await _repository.verify(code);
  }

}