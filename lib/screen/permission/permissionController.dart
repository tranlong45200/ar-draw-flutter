import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ar_draw/appRouter.dart';
import 'package:ar_draw/core/utils/snackbar_custom.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ar_draw/device/services/storage_service.dart';



class PermissonController extends GetxController {
  RxBool storagePermission = false.obs;
  RxBool cameraPermission = false.obs;
  RxBool recorderPermission = false.obs;
  var controller0 = ValueNotifier<bool>(false);
  var controller1 = ValueNotifier<bool>(true);
  var controller2 = ValueNotifier<bool>(false);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadPermissions();
  }

  Future<void> loadPermissions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    storagePermission.value = prefs.getBool('storagePermission') ?? false;
    cameraPermission.value = prefs.getBool('cameraPermission') ?? false;
    recorderPermission.value = prefs.getBool('recorderPermission') ?? false;
  }

  Future<void> savePermission(String key, bool value, bool isLimited) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (key == 'storagePermission') {
      storagePermission.value = value;
    }
    if (key == 'cameraPermission') {
      cameraPermission.value = value;
    }
    if (isLimited) {
      prefs.setBool(key, false);
    } else {
      prefs.setBool(key, value);
    }
  }

  Future<void> requestPermission(Permission permission, String key) async {
    PermissionStatus status;
    if (permission == Permission.camera) {
      status = await Permission.microphone.request();
    }
    status = await permission.request();
    if (status.isGranted || status.isLimited) {
      savePermission(key, true, status.isLimited);
    } else {
      savePermission(key, false, status.isLimited);
    }
    // loadPermissions();
  }

  Future<void> requestCameraPermission(BuildContext context) async {
    PermissionStatus status;
    status = await Permission.microphone.request();
    status = await Permission.camera.request();
    if (status.isGranted || status.isLimited) {
      if (storagePermission.value) {
        Get.offNamed(AppRouter.HOME_PAGE);
      } else {
        Get.offNamed(AppRouter.PERMISSON_STORAGE_PAGE);
      }
    } else {
      _showErrorSnackbar(context, "Cấp quyền truy cập để tiếp tục");
    }
    // loadPermissions();
  }
  

  Future<void> requestStoragePermission(BuildContext context) async {
    PermissionStatus status;
    status = await Permission.storage.request();

    if (status.isGranted || status.isLimited) {
      Get.offNamed(AppRouter.HOME_PAGE);
    } else {
      _showErrorSnackbar(context, "Cấp quyền truy cập để tiếp tục");
    }
  }

  void _showErrorSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackbarCustom(errorMessage: errorMessage).showSnackbarError()
    );
  }
}
