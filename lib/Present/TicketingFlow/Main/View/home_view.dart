import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/ViewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget { 
  const HomeView({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    final viewModel = Provider.of<HomeViewModel>(context);
    return const CupertinoPageScaffold(
      child: Text("MainView")
    );
  }
}