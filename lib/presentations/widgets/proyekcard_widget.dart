import 'package:flutter/material.dart';
import 'package:wrms_kominfo/utils/styles.dart';

class CardProyek extends StatelessWidget {
  // final String image;
  final String apkname;
  final String instansiname;
  const CardProyek({
    super.key,
    // required this.image,
    required this.apkname,
    required this.instansiname,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.23,
        decoration: BoxDecoration(
          color: kColorGrey2,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 7),
                width: size.width * 0.31,
                height: size.height * 0.13,
                decoration: BoxDecoration(
                  color: kColorGrey3,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                apkname,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                instansiname,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: kColorGrey4),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      '54%',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    '2 Minggu lagi',
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
