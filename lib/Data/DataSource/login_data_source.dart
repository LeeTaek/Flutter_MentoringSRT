import 'package:flutter_srt/Data/Services/APIServices.dart';
import 'package:flutter_srt/Model/APIResponse.dart';


class LoginDataSource { 

  final services = APIServices();

  Future<String> verify(String code) async { 
    final params = {"code": code};

  APIResponse<String> response = await services.postRequest(EndPoint.verify, params, (dynamic json) { 
    return json['data'] as String;
  });
  
  return response.data;
  }

}