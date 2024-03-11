import 'package:flutter_srt/Data/DataSource/login_data_source.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRepository { 
  Future<String?> verify(String code);
}

@injectable
class LoginRepositoryImpl implements LoginRepository { 
  final LoginDataSource _loginDataSource;
  LoginRepositoryImpl(this._loginDataSource);

@override
Future<String?> verify(String code) async { 
   return await _loginDataSource.verify(code);
}


}