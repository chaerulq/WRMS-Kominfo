import 'dart:io';

import 'package:flutter/material.dart';
import '../../presentations/pages/home/controller/home_controller.dart';
import '../../utils/state_resutl.dart';
import '../models/proyek_now_model.dart';

class ProyekNowProvider extends ChangeNotifier {
  final HomePageController homeController;

  ProyekNowProvider({required this.homeController}) {
    _fetchProyekNow();
  }

  late ProyekNowModel _ProyekNowModel;
  late StateResult _state;
  String _message = '';

  String get message => _message;

  ProyekNowModel get result => _ProyekNowModel;

  StateResult get state => _state;

  Future<dynamic> _fetchProyekNow() async {
    try {
      _state = StateResult.loading;
      notifyListeners();
      final proyeknow = await homeController.checkLogin();
      if (proyeknow.data.pembangunan.isEmpty) {
        _state = StateResult.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = StateResult.hasData;
        notifyListeners();
        return _ProyekNowModel = proyeknow;
      }
    } on SocketException {
      _state = StateResult.noConnection;
      notifyListeners();
      return _message = 'Please check your connection.';
    } catch (e) {
      _state = StateResult.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
