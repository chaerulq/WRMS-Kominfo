import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wrms_kominfo/presentations/widgets/proyekcard_widget.dart';

import '../../../data/models/proyek_next_model.dart';
import '../../../data/models/proyek_now_model.dart';
import '../../../utils/styles.dart';
import '../../widgets/aplication_error_widget.dart';
import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeController = Get.put(HomePageController());
  late Future<ProyekNowModel> _proyeknow;
  late Future<ProyekNextModel> _proyeknext;

  @override
  void initState() {
    super.initState();
    _proyeknow = homeController.checkLogin();
    _proyeknext = homeController.checkProyek();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final data = Provider.of<ProyekNextModel>(context, listen: false);
    return FutureBuilder(
      future: _proyeknext,
      builder: (context, AsyncSnapshot<ProyekNextModel> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          );
        } else {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: ListView(
                  children: [
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello,',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                              Consumer<ProyekNextModel>(
                                  builder: (context, value, snapshot) {
                                return Text(
                                  value.status.toString(),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                );
                              }),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.notifications_none_outlined),
                              SizedBox(width: 10),
                              Icon(Icons.person_rounded),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.0431),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: size.height * 0.094,
                          width: size.width * 0.27,
                          decoration: BoxDecoration(
                              color: kColorNavy,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.person,
                                      color: kColorSecondary,
                                    ),
                                    SizedBox(width: 9),
                                    Text(
                                      '14',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const Center(
                                child: Text(
                                  'Total Personel',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: ktextColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * 0.094,
                          width: size.width * 0.27,
                          decoration: BoxDecoration(
                              color: const Color(0xffFFE5E4),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.phone_android_outlined,
                                      color: Color(0xffFC544B),
                                    ),
                                    SizedBox(width: 9),
                                    Text(
                                      '25',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const Center(
                                child: Text(
                                  'Aplikasi Berjalan',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: ktextColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: size.height * 0.094,
                          width: size.width * 0.27,
                          decoration: BoxDecoration(
                              color: const Color(0xffFFE3BD),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.file_copy,
                                      color: Color(0xffFFA426),
                                    ),
                                    SizedBox(width: 9),
                                    Text(
                                      '43',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const Center(
                                child: Text(
                                  'Usulan',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: ktextColor),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: size.height * 0.0246),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: size.height * 0.094,
                        width: size.width * 0.88,
                        decoration: BoxDecoration(
                          color: kColorPrimary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.sports_gymnastics,
                                    size: 20,
                                    color: ktextColor,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Beban Kerja Keseluruhan saat ini',
                                    style: TextStyle(
                                        color: ktextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.0184),
                    Container(
                      height: size.height * 0.012,
                      color: kColorGrey1,
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.black54,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.black54,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.message_outlined,
                        color: Colors.black54,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.black54,
                      ),
                      label: ''),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Material(
                child: ApplicationError(),
              ),
            );
          } else {
            return const Material(
              child: Text(''),
            );
          }
        }
      },
    );
  }
}
