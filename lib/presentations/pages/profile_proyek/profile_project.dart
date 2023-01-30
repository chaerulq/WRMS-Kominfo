import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class ProfileProject extends StatelessWidget {
  const ProfileProject({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Center(
              child: Container(
                height: 200,
                width: 200,
                color: kColorGrey3,
              ),
            ),
            SizedBox(height: 20),
            // informasi personel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height * 0.035,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                      color: const Color(0xff6777EF),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      'sedang berjalan ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      'Personel',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: ktextColor),
                    ),
                    Text(
                      '3',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: ktextColor),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.outlined_flag_outlined,
                      size: 20,
                      color: ktextColor,
                    ),
                    Text(
                      'Bulan depan',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff6777EF),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            // informasi detail
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pembuatan ulang aplikasi susanmas / DINKOMINFO',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: ktextColor),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pembuatan ulang aplikasi susanmas',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kColorGrey5),
                ),
                const SizedBox(height: 50),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Menggunakan Teknologi',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: ktextColor),
                      ),
                      Container(
                        height: 30,
                        width: 40,
                        child: const Image(
                          image: AssetImage('assets/php.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: size.height * 0.01,
              color: kColorGrey2,
            ),
          ],
        ),
      ),
    );
  }
}
