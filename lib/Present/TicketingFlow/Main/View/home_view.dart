import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Components/srt_button.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/Component/recent_booking_view.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/Component/select_station_view.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/ViewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget { 
  const HomeView({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    final viewModel = Provider.of<HomeViewModel>(context);
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 24,), 
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 CupertinoButton(
                  child: Image.asset('assets/images/img_main_logo.png', width: 135.04, height: 22,), 
                  onPressed: () => viewModel.pushToAlarm(context)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CupertinoButton(
                      child: Image.asset('assets/images/alarm.png', width: 60, height: 60,), 
                      onPressed: () => viewModel.pushToAlarm(context)
                    ) ,
                    CupertinoButton(
                      child: Image.asset('assets/images/my_ticket.png', width: 60, height: 60,), 
                      onPressed: () => viewModel.pushToMyTicket(context)
                    ),
                  ]
                )
              ],
            ),
            const SizedBox(height: 16,),
            SelectStationView(
              departure: viewModel.departure,
              arrival: viewModel.arrive,
              setStationAction: () => viewModel.pushToSelectStation(context)
            ),
            const SizedBox(height: 20),
            RecentBookingView(
              infos: viewModel.homeData?.recentReservationList,
              callbackAction: viewModel.setRecentBooking
            ),
            const SizedBox(height: 20),
            Container(
              height: 62,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all( 
                  color: const Color.fromARGB(255, 238, 238, 238),
                  width: 1
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding( 
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text( 
                      "날짜", 
                      style: TextStyle( 
                        color: Color.fromARGB(255, 136, 136, 136),
                        fontSize: 16, 
                        fontFamily: 'SpoqaHanSansNeo',
                        fontWeight: FontWeight.w300   
                      ),
                    ), 
                    CupertinoButton(
                      onPressed: () => viewModel.setBookingDate,
                      child: Text( 
                        "${viewModel.bookingTimeString} 이후", 
                        style: const TextStyle( 
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16, 
                          fontFamily: 'SpoqaHanSansNeo',
                          fontWeight: FontWeight.w300    
                        ),
                      ),
                    ) 
                  ]
                )
              )
            ),
            const SizedBox(height: 12),
            Container(
              height: 62,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all( 
                  color: const Color.fromARGB(255, 238, 238, 238),
                  width: 1
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding( 
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text( 
                      "인원 수", 
                      style: TextStyle( 
                        color: Color.fromARGB(255, 136, 136, 136),
                        fontSize: 16, 
                        fontFamily: 'SpoqaHanSansNeo',
                        fontWeight: FontWeight.w300   
                      ),
                    ), 
                    CupertinoButton(
                      onPressed: () => viewModel.setPeopleCount(),
                      child: Text( 
                        "총 ${viewModel.peopleCount}명", 
                        style: const TextStyle( 
                            color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16, 
                          fontFamily: 'SpoqaHanSansNeo',
                          fontWeight: FontWeight.w300    
                        ),
                      ),
                    ) 
                  ]
                )
              )
            ), 
            const SizedBox(height: 24),
            SRTButton(
              height: 48, 
              title: "기차 조회하기", 
              enable: (viewModel.departure != null && viewModel.arrive != null),
              onPressed: viewModel.pushToSearchTrain
            ),
            const SizedBox(height: 48),
            CupertinoButton(
              onPressed: viewModel.pushToNotice,
              child: Container( 
                height: 20,
                alignment: Alignment.centerLeft,
                child: Row( 
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/bell.png', width: 20, height: 20,),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: Text( 
                        viewModel.homeData?.noticeList.first.title ?? "", 
                        style: const TextStyle( 
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14, 
                          fontFamily: 'SpoqaHanSansNeo',
                          fontWeight: FontWeight.w400     
                        )
                      )
                    ),
                    const SizedBox(width: 8,),
                    Image.asset('assets/images/push_to_next_icon.png', width: 20, height: 20,),
                  ],
                ),
              ), 
            ),
            const SizedBox(height: 16),
            

          ],
        ),
      )
    );
  }
}