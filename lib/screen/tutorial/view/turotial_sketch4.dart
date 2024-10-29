import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TutorialSketch4 extends GetView{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(child: Image.asset("assets/images/tutorial3.png",fit: BoxFit.cover,)),
        SizedBox(height: 16,),
        Text(
          "Securely prop up your phone using a sturdy surface like glass, a tripod, or any solid object.",
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