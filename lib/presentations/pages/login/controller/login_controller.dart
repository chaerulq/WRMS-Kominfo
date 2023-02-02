import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wrms_kominfo/data/models/user_model.dart';
import '../../../../data/api/api_handle.dart';
import '../../../../data/models/login_model.dart';
import '../../home/home_page.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() async {
    LoginModel loginModel = LoginModel(
      username: usernameController.text,
      password: passwordController.text,
    );
    var response =
        await ApiHandler.post(loginModelToJson(loginModel), "auth/login");
    var data = json.decode(response);
    // print(data);

    if (data['token'] == null) {
      print("login failed");
    } else {
      // print(data['token']);
      await ApiHandler.storeToken(data['token']);
      Get.offAll(const HomePage());

      // print(data['token']);
    }
  }
}
