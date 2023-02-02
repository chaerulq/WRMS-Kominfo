import 'package:flutter/material.dart';
import 'package:wrms_kominfo/data/provider/db_provider.dart';
import 'package:wrms_kominfo/presentations/pages/home.dart';
import 'package:wrms_kominfo/presentations/pages/home/home_page.dart';
import 'package:wrms_kominfo/presentations/pages/login/login_page.dart';
import 'package:wrms_kominfo/utils/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff6777EF),
        body: Center(
          child: Container(
            width: 120,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo_kominfo.png'),
              ),
            ),
          ),
        ));
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 2), () {
      DatabaseProvider().getToken().then((value) {
        if (value == '') {
          PageNavigator(ctx: context).nextPage(page: LoginPage());
        } else {
          PageNavigator(ctx: context).nextPage(page: HomePage());
        }
      });
    });
  }
}
