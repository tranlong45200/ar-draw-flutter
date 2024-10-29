import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ar_draw/appRouter.dart';
import 'package:flutter/cupertino.dart';
import 'package:ar_draw/model/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ar_draw/screen/permission/permissionController.dart';
class PermissionPage extends GetView {
  PermissonController permissonController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Permisson",
            style: TextStyle(
              color: Color(0xFF2970E4),
              fontFamily: "ComicSansMS",
              fontSize: 22,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                // Get.toNamed(AppRouter.INTRO_PAGE);
              },
              child: InkWell(
                onTap: () {
                  if(permissonController.cameraPermission.value && permissonController.storagePermission.value){
                    Get.offNamed(AppRouter.HOME_PAGE);
                  }
                  else{
                    if(permissonController.cameraPermission.value){
                          Get.offNamed(AppRouter.PERMISSON_STORAGE_PAGE);
                    }
                    else{
                      Get.offNamed(AppRouter.PERMISSON_CAMERA_PAGE );

                    }
                    
                    
                  }
                },
                child: const Text(
                  "Go",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "ComicSansMS",
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ]),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/images/PermissionImg.png",
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              "\"AR VR Drawing\" requires permission to use the (device’s camera and folder)",
              style: TextStyle(
                color: Color(0xFF2970E4),
                fontFamily: "ComicSansMS",
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(
            ()=> Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _permissionItem("Storage",
                    permissonController.storagePermission.value, (p0) {
                      if(p0){
                        permissonController.requestPermission(Permission.storage, "storagePermission");
            
                      }
            
                    })),
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(
            ()=> Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _permissionItem("Camera & Recorder",
                    permissonController.cameraPermission.value, (p0) {
                       permissonController.requestPermission(Permission.camera, "cameraPermission");
            
                    })),
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(
            ()=> Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _permissionItem("Screen Premissions",
                    permissonController.recorderPermission.value, (p0) {})),
          ),
        ],
      ),
    );
  }

  Widget _permissionItem(
      String label, bool isAccept, Function(bool)? onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColor.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "ComicSansMS",
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ),
          ),
          Transform.scale(
            scaleX: 0.8,
            scaleY: 0.8,
            child: Switch(
              value: isAccept,
               onChanged: onChanged,
              //  activeColor: Color(0xFF2970E4),
              activeTrackColor: Color(0xFF2970E4),
               
               ),
          )
        
        ],
      ),
    );
  }
}
