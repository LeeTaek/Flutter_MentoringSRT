
import 'package:flutter/cupertino.dart';

class CupertinoDialogPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final WidgetBuilder builder;

  const CupertinoDialogPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor,
    this.barrierDismissible = true,
    this.barrierLabel,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) => CupertinoDialogRoute<T>(
      context: context,
      settings: this,
      builder: builder,
      anchorPoint: anchorPoint,
      barrierColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
 );
}