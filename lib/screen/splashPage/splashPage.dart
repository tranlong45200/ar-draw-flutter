import 'package:ar_draw/screen/splashPage/splashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../model/constanst.dart';

class Splash extends GetWidget {
  SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set the background color of the splash screen
      body: Stack(
        children: [
          SvgPicture.asset("assets/svg/backgroundsplash.svg"),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0,
                                  3.0), // Start at the bottom of the screen
                              end: const Offset(
                                  0.0, 0.0), // End at the top of the screen
                            ).animate(controller.animation),
                            child: MyWidget(
                                context), // Replace MyWidget with your custom widget
                          ),
                          const SizedBox(
                            height: AppValues.padding,
                          ),

                          Obx(
                            () => Visibility(
                              visible: controller.isViewNameApp.value,
                              child: const Text(
                                "AR VR Drawing",
                                style: TextStyle(
                                  color: Color(0xFF2970E4),
                                  fontFamily: "ComicSansMS",
                                  fontSize: 32,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                          // const SizedBox(
                          //   height: AppValues.padding*4,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(() => Visibility(
                  visible: controller.isViewNav.value,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                      const SizedBox(
                        height: AppValues.padding,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: const Text(
                          "This action can contain ads",
                          style: TextStyle(
                            color: Color(0xFF2970E4),
                            fontFamily: "ComicSansMS",
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                const SizedBox(
                  height: AppValues.padding * 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget MyWidget(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/logo_splash.png",
          width: MediaQuery.of(context).size.width / 2,
        ));
  }
}
