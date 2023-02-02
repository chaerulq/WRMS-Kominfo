import 'package:flutter/material.dart';
import 'package:wrms_kominfo/data/models/proyek_now_model.dart';
import 'package:wrms_kominfo/utils/styles.dart';

class CardProyek extends StatelessWidget {
  // final String image;
  // final Pembangunan pembangunan;

  const CardProyek({
    super.key,
    // required this.image,

    // required this.pembangunan,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/noImageAvailable.png')),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              'XX',
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              'XX',
              maxLines: 1,
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
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "%",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  'XX',
                  style: TextStyle(fontSize: 5, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
