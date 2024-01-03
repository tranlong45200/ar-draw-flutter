import 'package:ar_draw/screen/shareController.dart';
import 'package:get/get.dart';

class ShareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
  }
}
