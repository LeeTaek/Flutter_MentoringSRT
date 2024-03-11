import 'package:flutter/cupertino.dart';
import 'project_navigator.dart';

abstract class Coordinator implements ProjectNavigator { 
  late Dependency dependency;
  Coordinator(
    this.dependency
  );
  Widget start();
  void end();
}

class Dependency<T extends Widget> { 
  List<Coordinator> naviStack;
  final Coordinator? parentCoordinator; 
  final T widget;

  Dependency({ 
    required this.naviStack,
    required this.parentCoordinator,
    required this.widget
  });
}