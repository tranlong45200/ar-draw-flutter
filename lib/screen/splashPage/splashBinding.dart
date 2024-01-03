import 'package:ar_draw/screen/splashPage/splashController.dart';
import 'package:get/get.dart';

class SplashBindind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
