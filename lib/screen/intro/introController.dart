import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ar_draw/appRouter.dart';
import 'package:ar_draw/screen/shareController.dart';

class IntroController extends GetxController {
  PageController pageController =
      PageController(viewportFraction: 1, keepPage: true);
      ShareController shareController = Get.find();
  RxInt index = 0.obs;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void changedIndexPage(int indexPage) {
    index.value = indexPage;
    pageController.animateToPage(indexPage,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void backHome() {
    index.value = 0;
    shareController.isUsed.value ?  Get.offNamed(AppRouter.HOME_PAGE):
    Get.offNamed(AppRouter.PERMISSON_PAGE);
  }
}
