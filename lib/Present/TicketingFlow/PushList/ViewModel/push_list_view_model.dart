import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Data/Model/push.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@injectable
class PushListViewModel with ChangeNotifier {
  late List<Push> pushList = [
    Push(title: '테스트', date: '입니당', description: '푸시내용입니당'), 
    Push(title: '테스트', date: '입니당', description: '푸시내용입니당'), 
    ];
  
  PushListViewModel();

  void popToMain(BuildContext context) { 
    GoRouter.of(context).pop();
  }


} 
