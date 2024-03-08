import 'package:flutter_srt/Domain/Repository/login_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase { 
  final LoginRepository _repository; 

  LoginUseCase(this._repository);

  Future<String?> getVerify(String code) async { 
    return await _repository.verify(code);
  }

}