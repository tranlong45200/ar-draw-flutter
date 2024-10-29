import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ar_draw/screen/intro/view/intro1.dart';
import 'package:ar_draw/screen/intro/view/intro2.dart';
import 'package:ar_draw/screen/intro/view/intro3.dart';
import 'package:ar_draw/screen/intro/introController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends GetWidget {
  IntroPage({super.key});

  IntroController introController = Get.find();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 3 / 5 +100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: PageView(
                controller: introController.pageController,
                onPageChanged: (indexPage) {
                  introController.changedIndexPage(indexPage);
                },
                children: [Intro1(), intro2(), Intro3()],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: introController.pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xFF2970E4),
                        dotColor: Colors.grey,
                        spacing: 12,
                        dotHeight: 10,
                        dotWidth: 10),
                  ),
                  InkWell(
                    onTap: () => introController.index != 2
                        ? introController
                            .changedIndexPage(introController.index.value + 1)
                        : introController.backHome(),
                    splashColor: Colors.transparent, // Loại bỏ hiệu ứng sóng
                    highlightColor: Colors.transparent,
                    child: Obx(
                      () => Text(
                        introController.index != 2 ? "Next" : "Start",
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
