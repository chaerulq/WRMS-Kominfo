import 'dart:convert';
import 'package:get/get.dart';
import 'package:wrms_kominfo/data/models/user_model.dart';
import '../../../../data/api/api_handle.dart';
import '../../home/home_page.dart';

class LoginController extends GetxController {
  // TextEditingController usernameLoginController = TextEditingController();
  // TextEditingController passwordLoginController = TextEditingController();
  Future<UserModel> login(String username, String password) async {
    // LoginModel loginModel = LoginModel(

    // );
    var response = await ApiHandler.post(username, password, "auth/login");
    // print(response);
    var data = json.decode(response);

    if (data['token'] == null) {
      print("login failed");
    } else {
      // print(data['token']);
      await ApiHandler.storeToken(data['token']);
      Get.offAll(const HomePage());

      // print(data['token']);
    }
    return UserModel.fromJson(
      json.decode(response),
    );
  }
}
