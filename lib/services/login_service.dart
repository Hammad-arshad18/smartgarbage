import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future loginApiCall(Map<String, dynamic> params) async {
    var url = Uri.parse(
        'https://smart-garbage-api.herokuapp.com/api/auth/accounts/login/');
    var response = await http.post(url, body: params);
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      APICacheDBModel cacheData =
          new APICacheDBModel(key: "login_token", syncData: data["key"]);
          // APICacheDBModel userDetail=new APICacheDBModel(key: "username",syncData: )
      await APICacheManager().addCacheData(cacheData);
    }
    // var cacheModel = await APICacheManager().getCacheData("login_token");
    // var delCacheModel = await APICacheManager().deleteCache("login_token");
    // print("Api Key : ${cacheModel.syncData}");
    return LoginResponse(token: data["key"], error: data["non_field_errors"]);
  }
}

class LoginResponse {
  final String? token;
  var error;
  LoginResponse({this.token, this.error});
}
