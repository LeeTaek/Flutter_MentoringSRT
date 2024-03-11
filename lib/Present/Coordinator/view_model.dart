import 'package:flutter/cupertino.dart';
import 'coordinator.dart';

abstract class ViewModel {  
  late final Coordinator coordinator;
  // ViewModel(this.coordinator);
  void dispose();
}


abstract class View<V extends ViewModel> extends Widget {
  final V viewModel;
  const View(this.viewModel, Key key) : super(key: key);
  
  void dispose() {}
}
