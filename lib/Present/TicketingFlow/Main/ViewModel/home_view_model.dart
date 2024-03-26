import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Data/Model/home_data.dart';
import 'package:flutter_srt/Domain/UseCase/ticket_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


@injectable 
class HomeViewModel with ChangeNotifier {
  final TicketUseCase ticketuseCase;
  late DateTime _bookingTime;
  late String bookingTimeString;
  late int peopleCount; 
  late HomeData? homeData = HomeData(recentReservationList: [], bannerList: [], noticeList:[]);
  Station? departure; 
  Station? arrive; 
  int currentBannerIndex = 0;

  HomeViewModel(this.ticketuseCase); 

  @factoryMethod
  static Future<HomeViewModel> init(TicketUseCase ticketUseCase) async { 
    final viewModel = HomeViewModel(ticketUseCase);
    viewModel.homeData = await viewModel.ticketuseCase.home();
    initializeDateFormatting('ko_KR');
    viewModel._bookingTime = DateTime.now();
    viewModel.bookingTimeString = DateFormat('yyyy.MM.dd(EEE) HH시', 'ko_KR').format(viewModel._bookingTime);
    viewModel.peopleCount = 1;
    debugPrint(viewModel.homeData?.bannerList.length.toString());
    return viewModel;
  }

  void pushToAlarm(BuildContext context) { 

  }

  void pushToMyTicket(BuildContext context) { 

  }

  void pushToSelectStation(BuildContext context) { 
    
  }

  void pushToSearchTrain() { 
  }

  void setRecentBooking(Station dep, Station arr) { 
  }

  void setBookingDate() { 

  }
  
  void setPeopleCount() { 

  }
  
  void pushToNotice() { 

  }

  void setCurrentIndex(int index) { 
    currentBannerIndex = index; 
    notifyListeners();
  }

  void pushToTermsUseServiceWeb() { 
    
  }

}