import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Intro3 extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Image.asset(
          "assets/images/intro3.png",
          fit: BoxFit.cover,
         
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "AR Drawing Made Easy",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontFamily: "ComicSansMS",
            fontSize: 18,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          "Learn to draw easily with AR technology.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF2970E4),
            fontFamily: "ComicSansMS",
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
