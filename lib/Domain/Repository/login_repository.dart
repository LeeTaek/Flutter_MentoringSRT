import 'package:flutter_srt/Data/DataSource/login_datasource.dart';
import 'package:flutter_srt/Data/Model/signup.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRepository { 
  Future<String?> verify(String code);
  Future<String?> signup(Signup signup);
  Future<String?> login(String email, String pw);
  Future<String?> getSignupCode(String email);
}

@injectable
class LoginRepositoryImpl implements LoginRepository { 
  final LoginDataSource _loginDataSource;
  LoginRepositoryImpl(this._loginDataSource);

  @override
  Future<String?> verify(String code) async { 
    return await _loginDataSource.verify(code);
  }

  @override 
  Future<String?> signup(Signup signup) async { 
    return await _loginDataSource.signup(signup);
  }

  @override 
  Future<String?> login(String email, String pw) async { 
    return await _loginDataSource.login(email, pw);
  }

  @override
  Future<String?> getSignupCode(String email) async { 
    return await _loginDataSource.getSignupCode(email);
  }
}