import 'package:ar_draw/screen/tutorial/tutorial_trace/tutorial_trace_controller.dart';
import 'package:get/get.dart';

class TutorialTraceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TutorialTraceController());
  }
}
