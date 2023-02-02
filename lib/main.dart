import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wrms_kominfo/data/provider/proyek_next_provider%20.dart';
import 'package:wrms_kominfo/data/provider/proyek_now_provider.dart';
import 'package:wrms_kominfo/presentations/pages/home/controller/home_controller.dart';
import 'package:wrms_kominfo/presentations/pages/home/home_page.dart';
import 'package:wrms_kominfo/presentations/pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProyekNow(homeController: HomePageController()),
        ),
        ChangeNotifierProvider(
          create: (_) => ProyekNext(homeController: HomePageController()),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
