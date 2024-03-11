import 'package:flutter_srt/Data/DataSource/login_data_source.dart';
import 'package:flutter_srt/Data/Services/APIServices.dart';
import 'package:flutter_srt/Domain/Repository/login_repository.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/ViewModel/login_view_model.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/ViewModel/signup_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() { 
  getIt
  ..registerSingleton<APIServices>(APIServices())
  ..registerFactory<LoginDataSource>( () => LoginDataSource())
  ..registerFactory<LoginRepository>(() => LoginRepositoryImpl(getIt<LoginDataSource>()))
  ..registerFactory<LoginUseCase>(() => LoginUseCase(getIt<LoginRepository>()))
  ..registerFactory<LoginViewModel>(() => LoginViewModel(getIt<LoginUseCase>()))
  ..registerFactory<SignupViewModel>(() => SignupViewModel(getIt<LoginUseCase>()));


}