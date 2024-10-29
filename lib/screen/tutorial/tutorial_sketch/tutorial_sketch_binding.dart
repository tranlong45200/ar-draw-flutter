import 'package:get/get.dart';
import 'package:ar_draw/screen/tutorial/tutorial_sketch/tutorial_sketch_controller.dart';

class TutorialSketchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TutorialSketchController());
  }
}
