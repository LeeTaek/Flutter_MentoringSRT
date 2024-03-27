import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Data/Model/signup.dart';
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
    return json['message'] as String?;
  });
  return _convertUtf8(response.message);
  }

  Future<String?> signup(Signup signup) async { 
    final params = { 
      "email": signup.email, 
      "pw": signup.pw,
      "birth": signup.birth,
      "name": signup.name
    };

    APIResponse<String?> response = await _services.postRequest(
      EndPoint.signup,
      params, 
      (dynamic json) { 
        return json['data'] as String?;
      });
    return _convertUtf8(response.message);
  }

  Future<String?> login(String email, String pw) async { 
    final params = { 
      "email": email,
      "pw": pw
    };

    APIResponse<String> response = await _services.postRequest(
      EndPoint.login,
      params, 
      (dynamic json) { 
        if (json['message'] != null) {
          return (json['message'] as String);
        } else {
          return 'failed login'; 
        }
      });
      debugPrint(response.toString());
      return _convertUtf8(response.message);
  }


  Future<String?> getSignupCode(String email) async { 
    final params = { 
      'email': email
    };

    APIResponse<String> response = await _services.getRequest(
      EndPoint.getSigninCode,
      params, 
      (dynamic json) { 
        return json['message'] as String;
      }); 

      return _convertUtf8(response.message);
  }

  String _convertUtf8(String? message) { 
    if (message != null){
      List<int> bytes = message.codeUnits;
      return utf8.decode(bytes);
    } 
    return "decoded fail";
  }

}