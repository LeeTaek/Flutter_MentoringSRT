import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/injection.dart';
import 'package:flutter_srt/Present/LoginFlow/Login/Coordinator/login_coordinator.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: LoginCoordinator().start()
    );
  }
}
