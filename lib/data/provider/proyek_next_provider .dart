import 'dart:io';

import 'package:flutter/material.dart';
import '../../presentations/pages/home/controller/home_controller.dart';
import '../../utils/state_resutl.dart';
import '../models/proyek_next_model.dart';
import '../models/proyek_now_model.dart';

class ProyekNext extends ChangeNotifier {
  final HomePageController homeController;

  ProyekNext({required this.homeController}) {
    _fetchProyekNext();
  }

  late ProyekNextModel _ProyekNextModel;
  late StateResult _state;
  String _message = '';

  String get message => _message;

  ProyekNextModel get result => _ProyekNextModel;

  StateResult get state => _state;

  Future<dynamic> _fetchProyekNext() async {
    try {
      _state = StateResult.loading;
      notifyListeners();
      final proyeknext = await homeController.checkProyek();
      if (proyeknext.data.pembangunan.isEmpty) {
        _state = StateResult.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = StateResult.hasData;
        notifyListeners();
        return _ProyekNextModel = proyeknext;
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
