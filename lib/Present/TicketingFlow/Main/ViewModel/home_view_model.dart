import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Domain/UseCase/ticket_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable 
class HomeViewModel with ChangeNotifier { 
  late final TicketUseCase _ticketuseCase;
  
  HomeViewModel( 
    this._ticketuseCase
  ) : super();


}