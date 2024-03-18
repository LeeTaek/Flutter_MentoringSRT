import 'package:flutter_srt/Data/Model/login_response.dart';
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
    return json['data'] as String?;
  });
  return response.data;
  }

  Future<String?> signup(Signup signup) async { 
    final params = { 
      "email": signup.email, 
      "pw": signup.pw,
      "brith": signup.brith,
      "name": signup.name
    };

    APIResponse<String?> response = await _services.postRequest(
      EndPoint.signup,
      params, 
      (dynamic json) { 
        return json['data'] as String?;
      });

    return response.data;
  }

  Future<String?> login(String email, String pw) async { 
    final params = { 
      "email": email,
      "pw": pw
    };

    APIResponse<LoginResponse> response = await _services.postRequest(
      EndPoint.login,
      params, 
      (dynamic json) { 
        return (json['data'] as LoginResponse);
      });

      return response.data?.name;
  }


  Future<String?> getSignupCode(String email) async { 
    final params = { 
      'email': email
    };

    APIResponse<String> response = await _services.getRequest(
      EndPoint.getSigninCode,
      params, 
      (dynamic json) { 
        return json['data'] as String;
      }); 

      return response.data;
  }

}