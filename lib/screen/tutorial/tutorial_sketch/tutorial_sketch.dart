import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ar_draw/screen/tutorial/view/turotial_sketch2.dart';
import 'package:ar_draw/screen/tutorial/view/turotial_sketch3.dart';
import 'package:ar_draw/screen/tutorial/view/turotial_sketch4.dart';
import 'package:ar_draw/screen/tutorial/view/turotial_sketch5.dart';
import 'package:ar_draw/screen/tutorial/view/tutorial_sketch1.dart';
import 'package:ar_draw/screen/tutorial/tutorial_sketch/tutorial_sketch_controller.dart';

class TutorialSketch extends GetWidget {
  TutorialSketch({super.key});

  TutorialSketchController tutorialSketchController = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 3 / 4,
        child: Column(
          children: [
            Expanded(
                child: PageView(
              controller: tutorialSketchController.pageController,
              onPageChanged: (indexPage) {
                tutorialSketchController.changedIndexPage(indexPage);
              },
              children: [
                TutorialSketch1(),
                TutorialSketch2(),
                TutorialSketch3(),
                TutorialSketch4(),
                TutorialSketch5(),
              ],
            )),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: tutorialSketchController.pageController,
                    count: 5,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xFF2970E4),
                        dotColor: Colors.grey,
                        spacing: 12,
                        dotHeight: 10,
                        dotWidth: 10),
                  ),
                  InkWell(
                    onTap: () => tutorialSketchController.index != 4
                        ? tutorialSketchController.changedIndexPage(
                            tutorialSketchController.index.value + 1)
                        :tutorialSketchController.backHome(),
                    splashColor: Colors.transparent, // Loại bỏ hiệu ứng sóng
                    highlightColor: Colors.transparent,
                    child: Obx(
                      () => Text(
                        tutorialSketchController.index != 4 ? "Next" : "Start",
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "ComicSansMS",
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
