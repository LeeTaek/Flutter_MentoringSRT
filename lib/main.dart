import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/injection.dart';
import 'package:flutter_srt/Present/router.dart' as srt_router;

void main() {
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<srt_router.Router>();
    return CupertinoApp.router(
      routerConfig: router.routerConfig,
    );
  }
}
