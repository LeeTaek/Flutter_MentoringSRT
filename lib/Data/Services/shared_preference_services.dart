import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferenceService { 
  static late SharedPreferences _sharedPreference;

  @factoryMethod
  static Future<SharedPreferenceService> init() async {
    _sharedPreference = await SharedPreferences.getInstance();
    return SharedPreferenceService();
  }

  Future<bool> setBool(String key, bool value) async => await _sharedPreference.setBool(key, value);
  
  Future<bool> setString(String key, String value) async => await _sharedPreference.setString(key, value);

  bool? getbool(String key) => _sharedPreference.getBool(key); 

  String? getString(String key) => _sharedPreference.getString(key);
}