import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class Intro1 extends GetView {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/intro1.png",
              fit: BoxFit.cover ,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Simple Sketching",
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Hone your drawing skills daily with our user-friendly app.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF2970E4),
                fontFamily: "ComicSansMS",
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
