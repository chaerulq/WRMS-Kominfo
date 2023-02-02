import 'package:flutter/material.dart';
import 'package:wrms_kominfo/utils/style.dart';

void showMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(
        message!,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: primaryColor));
}
