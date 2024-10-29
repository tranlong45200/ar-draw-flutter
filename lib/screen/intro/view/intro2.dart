import 'package:get/get.dart';
import 'package:flutter/material.dart';

class intro2 extends GetView{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(child: Image.asset("assets/images/intro2.png",fit: BoxFit.cover,)),
          // ignore: prefer_const_constructors
          SizedBox(height: 16,),
           const Text(
            "Master the Art of Drawing",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "ComicSansMS",
              fontSize: 18,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
            ),
          ),
           const SizedBox(height: 12,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Quick and easy drawing skills improve using camera images.",
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