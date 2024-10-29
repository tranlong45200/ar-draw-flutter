import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class TutorialSketch1 extends GetView{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(child: Image.asset("assets/images/tutorial.png",fit: BoxFit.cover,width:MediaQuery.of(context).size.width ,),),
        const SizedBox(height: 16,),
        const Text(

          "Easily import images from your gallery or select from various categories.",
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