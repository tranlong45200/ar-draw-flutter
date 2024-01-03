import 'package:ar_draw/appRouter.dart';
import 'package:ar_draw/screen/home/home_controller.dart';
import 'package:ar_draw/screen/home/view/item_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../model/constanst.dart';

class HomePage extends GetWidget {
  HomePage({super.key});

  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "AR VR Drawing",
              style: TextStyle(
                color: Color(0xFF2970E4),
                fontFamily: "ComicSansMS",
                fontSize: 22,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              SvgPicture.asset(
                "assets/svg/settings.svg",
                height: 28,
              ),
              const SizedBox(
                width: 12,
              )
            ]),
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/svg/home-background.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Image.asset("assets/images/trace.png"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: Container()),
                              Expanded(
                                  child: Center(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Trace Image",
                                        style: TextStyle(
                                          color: Color(0xFF2970E4),
                                          fontFamily: "ComicSansMS",
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                          "Improve drawing skills for stunning artwork.")
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppValues.padding,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppValues.padding),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRouter.CATEGORY_PAGE);
                                  },
                                  child: const HomeItem(
                                      title: "Creative Sketch",
                                      imagePath: "assets/images/slide.png",
                                      arrowSvgPath:
                                          "assets/svg/arrow-right.svg"))),
                          const SizedBox(
                            width: AppValues.padding,
                          ),
                          Expanded(
                              child: InkWell(
                                  onTap: () {},
                                  child: const HomeItem(
                                      title: "Trace Image",
                                      imagePath: "assets/images/slide1.png",
                                      arrowSvgPath:
                                          "assets/svg/arrow-right.svg"))),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppValues.padding,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppValues.padding),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                                  onTap: () {},
                                  child: const HomeItem(
                                      title: "My Creation",
                                      imagePath: "assets/images/slide2.png",
                                      arrowSvgPath:
                                          "assets/svg/arrow-right.svg"))),
                          const SizedBox(
                            width: AppValues.padding,
                          ),
                          Expanded(
                              child: InkWell(
                                  onTap: () {},
                                  child: const HomeItem(
                                      title: "Help To Drawing",
                                      imagePath: "assets/images/slide3.png",
                                      arrowSvgPath:
                                          "assets/svg/arrow-right.svg"))),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
