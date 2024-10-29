import 'package:get/get.dart';
import 'package:ar_draw/screen/intro/introController.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());
  }
}
