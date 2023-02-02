import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wrms_kominfo/data/provider/auth.dart';
import 'package:wrms_kominfo/data/provider/db_provider.dart';
import 'package:wrms_kominfo/presentations/pages/home/home_page.dart';
import 'package:wrms_kominfo/presentations/pages/splash_screen.dart';

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
        ChangeNotifierProvider(create: (_) => Authentication()),
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
