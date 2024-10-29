import 'package:get/get.dart';
import 'package:ar_draw/screen/permission/permissionController.dart';

class PermissonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PermissonController());
  }
}