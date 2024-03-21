import 'dart:convert';

import 'package:flutter_srt/Data/Model/APIResponse.dart';
import 'package:flutter_srt/Data/Model/device_info.dart';
import 'package:flutter_srt/Data/Model/home_data.dart';
import 'package:flutter_srt/Data/Model/reservation_info.dart';
import 'package:flutter_srt/Data/Model/storage.dart';
import 'package:flutter_srt/Data/Model/train_info.dart';
import 'package:flutter_srt/Data/Services/APIServices.dart';
import 'package:flutter_srt/injection.dart';
import 'package:injectable/injectable.dart';

@injectable 
class TicketDataSource { 
  final _service = getIt<APIServices>();

  Future<StorageListResponse> storage() async { 
    APIResponse<StorageListResponse> response = await _service.postRequest(
      EndPoint.storage,
      null, 
      (dynamic json) => StorageListResponse.fromJson(json)
    );
    return response.data ?? StorageListResponse(storageList: []);
  }

  Future<TrainInfoListResponse> srtList(String depID, String arrID, String depDate, String depTime) async { 
    final params = { 
      'depPlaceId': depID,
      'arrPlaceId': arrID,
      'depPlandDate': depDate,
      'depPlandTime': depTime
    };
    APIResponse<TrainInfoListResponse> response = await _service.postRequest(
      EndPoint.srtList, 
      params, 
      (dynamic json) => TrainInfoListResponse.fromJson(json)
    );
    return response.data ?? TrainInfoListResponse(trainInfoList: [], totalCount: 0);
  }

  Future<HomeData> home() async { 
    APIResponse<HomeData> response = await _service.postRequest(
      EndPoint.home,
      null, 
      (dynamic json) => HomeData.fromJson(json) 
    );
    return response.data ?? HomeData(recentReservationList: [], bannerList: [], noticeList: []);
  }

  Future<String> reserve(ReservationInfo info) async { 
    final params = info.toJson();
    APIResponse<String> response = await _service.postRequest(
      EndPoint.reserve, 
      params, 
      (dynamic json) { 
        return json['data'] as String;
      }
    );
    return _convertUtf8(response.data ?? "");
  }

  Future<StatusResponse> deviceInfo(DeviceInfo info) async { 
    final params = info.toJson();
    APIResponse<StatusResponse> response = await _service.postRequest(
      EndPoint.device, 
      params, 
      (dynamic json) => StatusResponse.fromJson(json)
    );
    return response.data ?? StatusResponse(status: "");
  }

  String _convertUtf8(String? message) { 
    if (message != null){
      List<int> bytes = message.codeUnits;
      return utf8.decode(bytes);
    } 
    return "decoded fail";
  }

}