import 'package:flutter_srt/Data/Model/device_info.dart';
import 'package:flutter_srt/Data/Model/home_data.dart';
import 'package:flutter_srt/Data/Model/reservation_info.dart';
import 'package:flutter_srt/Data/Model/storage.dart';
import 'package:flutter_srt/Data/Model/train_info.dart';
import 'package:flutter_srt/Domain/Repository/ticket_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TicketUseCase { 
  final TicketRepository _repository; 
  TicketUseCase(this._repository);

  Future<StorageListResponse> storage() async { 
    return await _repository.storage();
  }

  Future<TrainInfoListResponse> srtList(String depID, String arrID, String depDate, String depTime) async { 
    return await _repository.srtList(depID, arrID, depDate, depTime);
  }

  Future<HomeData> home() async { 
    return await _repository.home();
  }
 
  Future<String> reserve(ReservationInfo info) async { 
    return await _repository.reserve(info);
  }

  Future<StatusResponse> deviceInfo(DeviceInfo info) async { 
    return await _repository.deviceInfo(info);
  }
  
}