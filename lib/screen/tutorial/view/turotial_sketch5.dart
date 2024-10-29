import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TutorialSketch5 extends GetView{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(child: Image.asset("assets/images/tutorial4.png",fit: BoxFit.cover,)),
        SizedBox(height: 16,),
        Text(
          "Optionally, document your creative process and capture images along the way.",
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