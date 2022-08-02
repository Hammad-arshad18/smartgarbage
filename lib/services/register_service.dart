import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  Future RegisterApi(Map<String, dynamic> params) async {
    var url = Uri.parse(
        'https://smart-garbage-api.herokuapp.com/api/auth/registration/');
    var response = await http.post(url, body: params);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var cacheModel =
          await APICacheDBModel(key: "login_token", syncData: data["key"]);
      await APICacheManager().addCacheData(cacheModel);
    }
    // print(data);
    return RegisterationResponse(
        username: data["username"],
        email: data["email"],
        password: data["password1"],
        token: data["token"]);
  }
}

class RegisterationResponse {
  final String? token;
  var username;
  var email;
  var password;
  RegisterationResponse({this.token, this.email, this.username, this.password});
}
