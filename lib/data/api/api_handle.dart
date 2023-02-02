import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:wrms_kominfo/data/models/user_reqres_model.dart';

class ApiHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();
  Future<UserReqresModel> userReqres() async {
    var response = await client.get(Uri.parse('https://reqres.in/api/users/2'));
    // print(response.body);
    return UserReqresModel.fromJson(json.decode(response.body));
    ;
    // var data = json.decode(response.body);
    // print(data['token']);
    // print(response.body);
    // storeToken(data['token']);
  }

  static Future<dynamic> get(String endPoint, String? token) async {
    var response = await client.get(buildUrl(endPoint), headers: {
      "Content-type": "application/json",
      "authorization": "Bearer $token",
    });
    return response.body;
  }

  static Uri buildUrl(String endPoint) {
    String host = "https://reqres.in/api/users/2";
    final apiPath = host + endPoint;
    return Uri.parse(apiPath);
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }
}
