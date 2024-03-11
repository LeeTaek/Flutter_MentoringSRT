import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Login/ViewModel/login_view_model.dart';
import 'package:flutter_srt/Present/Login/View/login_view.dart';
import 'package:flutter_srt/injection.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: ChangeNotifierProvider(
        create: (context) => getIt<LoginViewModel>(),
        child: const LoginView(),
      ),
    );
  }
}
