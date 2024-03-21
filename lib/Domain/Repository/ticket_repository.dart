
import 'package:flutter_srt/Data/DataSource/ticket_datasource.dart';
import 'package:flutter_srt/Data/Model/device_info.dart';
import 'package:flutter_srt/Data/Model/home_data.dart';
import 'package:flutter_srt/Data/Model/reservation_info.dart';
import 'package:flutter_srt/Data/Model/storage.dart';
import 'package:flutter_srt/Data/Model/train_info.dart';
import 'package:injectable/injectable.dart';

abstract class TicketRepository { 
  Future<StorageListResponse> storage();
  Future<TrainInfoListResponse> srtList(String depID, String arrID, String depDate, String depTime);
  Future<HomeData> home();
  Future<String> reserve(ReservationInfo info);
  Future<StatusResponse> deviceInfo(DeviceInfo info);
}

@injectable 
class TicketRepositoryImpl implements TicketRepository { 
  final TicketDataSource _ticketDataSource;
  TicketRepositoryImpl(this._ticketDataSource);

  @override 
  Future<StorageListResponse> storage() async { 
    return await _ticketDataSource.storage();
  }

  @override 
  Future<TrainInfoListResponse> srtList(String depID, String arrID, String depDate, String depTime) async { 
    return await _ticketDataSource.srtList(depID, arrID, depDate, depTime);
  }

  @override 
  Future<HomeData> home() async { 
    return await _ticketDataSource.home();
  }

  @override 
  Future<String> reserve(ReservationInfo info) async { 
    return await _ticketDataSource.reserve(info);
  }

  @override 
  Future<StatusResponse> deviceInfo(DeviceInfo info) async { 
    return await _ticketDataSource.deviceInfo(info);
  }

}