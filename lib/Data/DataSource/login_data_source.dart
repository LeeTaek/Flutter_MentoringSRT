import 'package:flutter_srt/Data/Services/APIServices.dart';
import 'package:flutter_srt/Data/Model/APIResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_srt/injection.dart';


@injectable
class LoginDataSource {
  final _services = getIt<APIServices>();

  Future<String?> verify(String code) async { 
    final params = {"code": code};

  APIResponse<String?> response = await _services.postRequest(EndPoint.verify, params, (dynamic json) { 
    return json['data'] as String?;
  });
  
  return response.data;
  }

}