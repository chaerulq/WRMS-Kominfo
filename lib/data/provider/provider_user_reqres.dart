import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:wrms_kominfo/data/api/api_handle.dart';
import 'package:wrms_kominfo/data/models/user_reqres_model.dart';
import 'package:wrms_kominfo/utils/state_resutl.dart';

class UserReqresProvider extends ChangeNotifier {
  final ApiHandler apiHandler;

  UserReqresProvider({required this.apiHandler}) {
    _fetchAllUser();
  }

  late UserReqresModel _userReqresModel;
  late StateResult _state;
  String _message = '';

  String get message => _message;

  UserReqresModel get result => _userReqresModel;

  StateResult get state => _state;

  Future<dynamic> _fetchAllUser() async {
    try {
      _state = StateResult.loading;
      notifyListeners();
      final userReqres = await apiHandler.userReqres();
      if (userReqres.data.avatar.isEmpty) {
        _state = StateResult.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = StateResult.hasData;
        notifyListeners();
        return _userReqresModel = userReqres;
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
