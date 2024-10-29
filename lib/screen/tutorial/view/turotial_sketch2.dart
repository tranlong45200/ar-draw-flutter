import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TutorialSketch2 extends GetView{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(child: Image.asset("assets/images/tutorial1.png",fit: BoxFit.cover,)),
        SizedBox(height: 16,),
        Text(
          "Enhance your drawing experience by applying various effects available in this section.",
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