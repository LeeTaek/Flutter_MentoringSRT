import 'package:flutter/cupertino.dart';

typedef NavigationIdentifier = int;
abstract class NavigationIdentifiers {
  static const NavigationIdentifier none = 0;
}

abstract class ProjectNavigator { 
  ProjectNavigator();

  Widget move(NavigationIdentifier to, BuildContext context);
}