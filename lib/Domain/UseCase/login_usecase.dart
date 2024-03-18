import 'package:flutter_srt/Data/Model/signup.dart';
import 'package:flutter_srt/Domain/Repository/login_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase { 
  final LoginRepository _repository; 

  LoginUseCase(this._repository);

  Future<String?> getVerify(String code) async { 
    return await _repository.verify(code);
  }

  Future<String?> signup(Signup signup) async { 
    return await _repository.signup(signup);
  }

  Future<String?> login(String email, String pw) async { 
    return await _repository.login(email, pw);
  }

  Future<String?> getSignupcode(String email) async { 
    return await _repository.getSignupCode(email);
  }

}