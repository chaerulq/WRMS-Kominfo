import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wrms_kominfo/data/api/api_handle.dart';
import 'dart:convert';
import '../../presentations/pages/home.dart';
import '../../presentations/pages/home/home_page.dart';
import '../../utils/routers.dart';
import '../models/user_model.dart';
import 'db_provider.dart';

class Authentication extends ChangeNotifier {
  static final client = http.Client();

  // Setter
  bool _isLoading = false;
  String _resMessage = '';

  // Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void loginUser({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      var response = await ApiHandler.post(username, password, 'auth/login');
      var data = (json.decode(response));
      _isLoading = false;
      if (data['token'] != null) {
        _resMessage = "Login successfull";
        print(_resMessage);
        notifyListeners();
        final userId = data['user']['id'];
        final token = data['token'];
        DatabaseProvider().saveToken(token);
        PageNavigator(ctx: context).nextPageOnly(page: const Home());
      } else {
        _resMessage = "Username of password incorrect";
        print(_resMessage);
      }
      notifyListeners();
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available`";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again`";
      notifyListeners();

      print(":::: $e");
    }
  }

  void clear() {
    _resMessage = "";
    // _isLoading = false;
    notifyListeners();
  }
}
