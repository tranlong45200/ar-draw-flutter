import 'package:ar_draw/screen/tutorial/tutorial_trace/tutorial_trace_controller.dart';
import 'package:ar_draw/screen/tutorial/view/turotial_sketch2.dart';
import 'package:ar_draw/screen/tutorial/view/turotial_sketch6.dart';
import 'package:ar_draw/screen/tutorial/view/turotial_sketch7.dart';
import 'package:ar_draw/screen/tutorial/view/turotial_sketch8.dart';
import 'package:ar_draw/screen/tutorial/view/tutorial_sketch1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TutorialTrace extends GetWidget {
  TutorialTrace({super.key});

  TutorialTraceController tutorialTraceController = Get.find();
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
              controller: tutorialTraceController.pageController,
              onPageChanged: (indexPage) {
                tutorialTraceController.changedIndexPage(indexPage);
              },
              children: [
                TutorialSketch7(),
                TutorialSketch8(),
                TutorialSketch6()
              ],
            )),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: tutorialTraceController.pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xFF2970E4),
                        dotColor: Colors.grey,
                        spacing: 12,
                        dotHeight: 10,
                        dotWidth: 10),
                  ),
                  InkWell(
                    onTap: () => tutorialTraceController.index != 2
                        ? tutorialTraceController.changedIndexPage(
                        tutorialTraceController.index.value + 1)
                        :tutorialTraceController.backHome(),
                    splashColor: Colors.transparent, // Loại bỏ hiệu ứng sóng
                    highlightColor: Colors.transparent,
                    child: Obx(
                      () => Text(
                        tutorialTraceController.index != 2 ? "Next" : "Start",
                        style: TextStyle(
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
