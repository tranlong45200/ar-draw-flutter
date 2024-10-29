import 'package:get/get.dart';
import 'package:ar_draw/screen/my_creation/my_creation_controller.dart';


class MyCreationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCreationController());
  }
}
