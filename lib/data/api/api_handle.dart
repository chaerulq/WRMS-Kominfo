import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();
  static Future<String> post(
      String username, String password, String endPoint) async {
    var response = await client.post(buildUrl(endPoint), body: {
      "username": username,
      "password": password,
    });
    return response.body;
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
    String host = "http://10.98.33.36/api/v1/";
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
