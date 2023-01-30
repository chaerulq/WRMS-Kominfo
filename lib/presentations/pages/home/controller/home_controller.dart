import 'dart:convert';

import 'package:get/get.dart';

import '../../../../data/api/api_handle.dart';
import '../../../../data/models/proyek_now_model.dart';

class HomePageController extends GetxController {
  RxString? token;
  RxBool loggedIn = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  Future<ProyekNowModel> checkLogin() async {
    var scopedToken = await ApiHandler.getToken();
    token?.value = scopedToken!;
    loggedIn.value = true;
    var response =
        await ApiHandler.get("dashboard/projek-saat-ini", scopedToken);
    print(response);
    if (response != null) {
      return ProyekNowModel.fromJson(
        json.decode(response),
      );
      // print('succes');
    } else {
      throw Exception('Failed to load');
    }
  }
}