// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:wrms_kominfo/data/models/user_model.dart';
// import 'package:wrms_kominfo/presentations/pages/login/controller/login_controller.dart';
// import '../../utils/state_resutl.dart';
// import 'auth.dart';

// class NewsProvider extends ChangeNotifier {
//   final LoginController loginController;

//   NewsProvider({required this.loginController}) {
//     _fetchAllArticle();
//   }

//   late UserModel _userModel;
//   late StateResult _state;
//   String _message = '';

//   String get message => _message;

//   UserModel get result => _userModel;

//   StateResult get state => _state;

//   Future<dynamic> _fetchAllArticle() async {
//     try {
//       _state = StateResult.loading;
//       notifyListeners();
//       final article = await loginController.();
//       if (article.articles.isEmpty) {
//         _state = StateResult.noData;
//         notifyListeners();
//         return _message = 'Empty Data';
//       } else {
//         _state = StateResult.hasData;
//         notifyListeners();
//         return _userModel = article;
//       }
//     } on SocketException {
//       _state = StateResult.noConnection;
//       notifyListeners();
//       return _message = 'Please check your connection.';
//     } catch (e) {
//       _state = StateResult.error;
//       notifyListeners();
//       return _message = 'Error --> $e';
//     }
//   }
// }
