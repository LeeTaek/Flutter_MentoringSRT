import 'package:flutter/cupertino.dart';
import 'package:flutter_srt/Data/Model/APIResponse.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'dart:convert';

enum EndPoint { 
  verify("verity"),
  signup("signup"),
  logout("logout"),
  login("login"),
  getSigninCode("code");

  final String url;
  const EndPoint(this.url);
}

@singleton
class APIServices { 
  static const _privateKey = "WGjxqF8b2go9+eZPF7FWbfOrDrsYzrO6KCvQXDkNDaKp2OSl6t9XPWvIPYeYGbglvO2i/GDPxoIgAxjzf9c8lw==";
  static const _baseURL = "http://dpms.openobject.net:4132";

 Future<APIResponse<T>> postRequest<T>(EndPoint endPoint, Map<String, dynamic> params, T Function(dynamic) fromJsonT) async { 
  final url = Uri.parse('$_baseURL/${endPoint.url}');
  final header = {"Content-Type": 'application/json'};
  var parameters = params;
  parameters["key"] = _privateKey;
  final body = jsonEncode(parameters);

  try { 
    var response = await http.post(url, headers: header, body: body);
    if (response.statusCode == 200) { 
      var jsonResponse = json.decode(response.body);
      return APIResponse.fromJson(jsonResponse, fromJsonT);
    } else { 
        throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) { 
    debugPrint("http post failed: $e");
    throw e;
  } 
}


 Future<APIResponse<T>> getRequest<T>(EndPoint endPoint, Map<String, dynamic> params, T Function(dynamic) fromJsonT) async { 
  final url = Uri.parse('$_baseURL/${endPoint.url}').replace(queryParameters: params);

  try { 
    var response = await http.get(url);
    if (response.statusCode == 200) { 
      var jsonResponse = json.decode(response.body);
      return APIResponse.fromJson(jsonResponse, fromJsonT);
    } else { 
        throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) { 
    debugPrint("http post failed: $e");
    throw e;
  } 
 }
 
}
