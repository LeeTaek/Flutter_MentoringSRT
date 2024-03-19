import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Domain/UseCase/login_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:go_router/go_router.dart';

@injectable 
class SignupViewModel with ChangeNotifier { 
  late final LoginUseCase _loginUseCase;
  final formKey = GlobalKey<FormState>();
  SignupViewModel(this._loginUseCase) : super(); 

  void popToLoginView(BuildContext context) { 
    GoRouter.of(context).go('/login');
  }

}