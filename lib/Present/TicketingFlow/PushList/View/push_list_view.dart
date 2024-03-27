import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Components/navigation_bar.dart';
import 'package:flutter_srt/Present/Components/notosans_text.dart';
import 'package:flutter_srt/Present/TicketingFlow/PushList/ViewModel/push_list_view_model.dart';
import 'package:provider/provider.dart';

class PushListView extends StatelessWidget { 
  const PushListView({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    final viewModel = Provider.of<PushListViewModel>(context);
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavigationBar(
              title: '알림함',
              leadingButton: CupertinoButton( 
                padding: const EdgeInsets.all(0),
                child: Image.asset('assets/images/navi_back_button.png', width: 24, height: 24,), 
                onPressed: () => viewModel.popToMain(context),
              ),
            ),
            Expanded(
              child: (viewModel.pushList.isEmpty) ? 
              Container( 
                alignment: Alignment.center,
                child: Column ( 
                  children: [
                    const SizedBox(height: 160,),
                    Image.asset('assets/images/img_empty.png', width: 80, height: 80,),
                    const SizedBox(height: 16,),
                    const NotoSansText(
                      text: '알림 내역이 없습니다.',
                      color:  Color.fromARGB(255, 102, 102, 102)
                      )
                  ],
                ),
              )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  itemCount: viewModel.pushList.length,
                  itemBuilder: (context, index) { 
                    return Container(
                      decoration: BoxDecoration( 
                        border: Border.all( 
                          color: const Color.fromARGB(255, 238, 238, 238),
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
                      child: Column( 
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                          Row( 
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [ 
                              NotoSansText(
                                text: viewModel.pushList[index].title, 
                                size: 14,
                              ), 
                              NotoSansText(
                                text: viewModel.pushList[index].date,
                                size: 14,
                                color: const Color.fromARGB(255, 136, 136, 136)
                              )
                            ],
                          ),
                          NotoSansText(
                            text: viewModel.pushList[index].description,
                            size: 14,
                            color: const Color.fromARGB(255, 102, 102, 102),
                          )
                        ],
                      )
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 15), 
                  )
              )
            )
          ],
        )
      )
    );
  }
}
