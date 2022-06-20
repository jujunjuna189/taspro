import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taspro/model/user_model.dart';
import 'package:taspro/utils/api_const.dart';

class AuthRepo {
  AuthRepo._privateConstructor();
  static final AuthRepo instance = AuthRepo._privateConstructor();

  final _uriLogin = ApiConst.authLogin;
  final _uriRegister = ApiConst.authRegister;

  Future authLogin(Map<String, dynamic> data) async {
    try{
      Map<String, dynamic> dataBatch = {
        'email': data['email'],
        'password': data['password'],
      };

      final response = await http.post(Uri.parse(_uriLogin), body: dataBatch);

      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        Iterable iterable = jsonResponse['data'];
        //Set session
        setSession("user", iterable.first);
        return true;
      }
    }catch(e){
      print(e.toString());
    }

    return false;
  }

  Future authRegister(Map<String, dynamic> data) async {
    try{
      Map<String, dynamic> dataBatch = {
        'name': data['name'],
        'email': data['email'],
        'password': data['password'],
      };

      final response = await http.post(Uri.parse(_uriRegister), body: dataBatch);

      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        Iterable iterable = jsonResponse['data'];
        //Set session
        setSession("user", iterable.first);
        return true;
      }
    }catch(e){
      print(e.toString());
    }

    return false;
  }

  Future authLogout() async {
    final preference = await SharedPreferences.getInstance();
    preference.clear();
    return true;
  }

  Future<void> setSession(String key, Map<String, dynamic> value) async {
    final preference = await SharedPreferences.getInstance();
    if(preference.containsKey(key)){
      preference.remove(key);
    }
    preference.setString(key,  jsonEncode(value));
  }

  Future getSession(String key) async {
    final preference = await SharedPreferences.getInstance();
    if(preference.containsKey(key)){
      final data = jsonDecode(preference.getString(key).toString());
      return data;
    }else{
      return null;
    }
  }
}