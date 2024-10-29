import 'package:ar_draw/screen/make_text/make_text_controller.dart';
import 'package:get/get.dart';

class MakeTextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MakeTextController());
  }
}
