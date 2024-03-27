import 'package:flutter_srt/Data/DataSource/login_datasource.dart';
import 'package:flutter_srt/Data/DataSource/ticket_datasource.dart';
import 'package:flutter_srt/Data/Services/APIServices.dart';
import 'package:flutter_srt/Data/Services/shared_preference_services.dart';
import 'package:flutter_srt/Domain/Repository/login_repository.dart';
import 'package:flutter_srt/Domain/Repository/ticket_repository.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:flutter_srt/Domain/UseCase/ticket_usecase.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/ViewModel/login_view_model.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Signup/ViewModel/signup_view_model.dart';
import 'package:flutter_srt/Present/LoginFlow/Signup/Verify/ViewModel/signup_verify_view_model.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/ViewModel/home_view_model.dart';
import 'package:flutter_srt/Present/TicketingFlow/PushList/ViewModel/push_list_view_model.dart';
import 'package:flutter_srt/Present/router.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() { 
  /// DataLayer DI Regist
  getIt
    ..registerSingleton<Router>(Router(false))
    ..registerSingleton<APIServices>(APIServices())
    ..registerSingletonAsync<SharedPreferenceService>(() => SharedPreferenceService.init())
    ..registerFactory<LoginDataSource>( () => LoginDataSource())
    ..registerFactory<TicketDataSource>(() => TicketDataSource());

  /// DomainLayer DI Regist
  getIt
    ..registerFactory<LoginRepository>(() => LoginRepositoryImpl(getIt<LoginDataSource>()))
    ..registerFactory<LoginUseCase>(() => LoginUseCase(getIt<LoginRepository>()))
    ..registerFactory<TicketRepository>(() => TicketRepositoryImpl(getIt<TicketDataSource>()))
    ..registerFactory<TicketUseCase>(() => TicketUseCase(getIt<TicketRepository>()));

  /// PresentLayer DI Regist
  getIt
    ..registerFactory<LoginViewModel>(() => LoginViewModel(getIt<LoginUseCase>()))
    ..registerFactory<SignupVerifyViewModel>(() => SignupVerifyViewModel(getIt<LoginUseCase>()))
    ..registerFactory<SignupViewModel>(() => SignupViewModel(getIt<LoginUseCase>()))
    ..registerFactoryAsync<HomeViewModel>(() => HomeViewModel.init(getIt<TicketUseCase>()))
    ..registerFactory<PushListViewModel>(() => PushListViewModel());

}