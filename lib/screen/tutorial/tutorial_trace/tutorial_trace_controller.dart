import 'package:ar_draw/appRouter.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TutorialTraceController extends GetxController {
  PageController pageController = PageController(viewportFraction: 1, keepPage: true);
  RxInt index = 0.obs;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  void changedIndexPage(int indexPage){
    index.value = indexPage;
    pageController.animateToPage(indexPage,
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);

  }
  void backHome(){
    index.value =0;
  Get.offNamed(AppRouter.HOME_PAGE);
}

  
}
