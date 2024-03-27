import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Present/Components/notosans_text.dart';
import 'package:flutter_srt/Present/Components/srt_button.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/Component/banner_swiper_controller.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/Component/recent_booking_view.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/Component/select_station_view.dart';
import 'package:flutter_srt/Present/TicketingFlow/Main/ViewModel/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatelessWidget { 
  const HomeView({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) { 
    final viewModel = Provider.of<HomeViewModel>(context);
    return CupertinoPageScaffold(
      child: SingleChildScrollView ( 
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [  
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 21, 24, 16), 
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        child: Image.asset('assets/images/img_main_logo.png', width: 135.04, height: 22,), 
                        onPressed: () => viewModel.pushToPushList(context)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CupertinoButton(
                            child: Image.asset('assets/images/alarm.png', width: 60, height: 60,), 
                            onPressed: () => viewModel.pushToPushList(context)
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
                          NotoSansText( 
                            text: "날짜", 
                            color: const Color.fromARGB(255, 136, 136, 136),
                            size: 16, 
                          ), 
                          CupertinoButton(
                            onPressed: () => viewModel.setBookingDate,
                            child: NotoSansText( 
                              text: "${viewModel.bookingTimeString} 이후", 
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
                          NotoSansText( 
                            text: "인원 수", 
                            color: const Color.fromARGB(255, 136, 136, 136), 
                          ), 
                          CupertinoButton(
                            onPressed: () => viewModel.setPeopleCount(),
                            child: NotoSansText( 
                              text: "총 ${viewModel.peopleCount}명", 
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
                            child: NotoSansText( 
                              text: viewModel.homeData?.noticeList.first.title ?? "", 
                              size: 14, 
                              fontWeight: NotoSansFontWeight.medium
                            )
                          ),
                          const SizedBox(width: 8,),
                          Image.asset('assets/images/push_to_next_icon.png', width: 20, height: 20,),
                        ],
                      ),
                    ), 
                  ),
                  const SizedBox(height: 16),
                  SizedBox( 
                    height: 160,
                    child: Swiper(
                      scrollDirection: Axis.horizontal,
                      loop: true,
                      autoplay: (viewModel.homeData?.bannerList.length != 1) ,
                      autoplayDelay: 10000,
                      control: BannerSwiperControl( 
                        previousImage: Image.asset('assets/images/berfore_banner.png', width: 24, height: 24,),
                        nextImage: Image.asset('assets/images/next_banner.png', width: 24, height: 24,),
                        size: 24
                      ),
                      itemCount: viewModel.homeData?.bannerList.length ?? 0,
                      indicatorLayout: PageIndicatorLayout.COLOR,
                      itemBuilder: (context, index) { 
                        return Image.network(
                          'http://dpms.openobject.net:4132${viewModel.homeData?.bannerList[index].imgUrl ?? ''}', 
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                        );
                      },
                      onIndexChanged: (value) => viewModel.setCurrentIndex(value)
                    )
                  ),
                  const SizedBox(height: 14),
                  SizedBox( 
                    width: 76,
                    height: 6, 
                    child: AnimatedSmoothIndicator(
                      activeIndex: viewModel.currentBannerIndex, 
                      count: viewModel.homeData?.bannerList.length ?? 1,
                      effect: const ExpandingDotsEffect(
                        expansionFactor: 2,
                        dotWidth: 8,
                        dotHeight: 8,
                        radius: 8,
                        dotColor: Color.fromARGB(255, 221, 221, 221),
                        activeDotColor: Color.fromARGB(255, 2, 59, 90),
                      ),
                    )
                  ),
                  const SizedBox(height: 48),
                  CupertinoButton(
                    onPressed: viewModel.pushToTermsUseServiceWeb,
                    child:  Container( 
                      alignment: Alignment.center,
                      child: NotoSansText( 
                        text: "예매 서비스 이용약관",
                        color: const Color.fromARGB(255, 102, 102, 102),
                        size: 12, 
                        decoration: TextDecoration.underline
                      )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 82,
              color: const Color.fromARGB(255, 248, 248, 248),
              child:  Padding( 
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: NotoSansText( 
                  text: '통신판매중개자로, 통신판매의 당사자가 아닙니다.\n예매 및 환불 등 거래에 대한 의무와 책임은 거래당사자인\n한국철도공사에 있습니다.',
                  color: const Color.fromARGB(255, 136, 136, 136),
                  size: 11, 
                  textAlign: TextAlign.center,
                )
              ),
            )
          ]
        ),
      )
    );
  }
}