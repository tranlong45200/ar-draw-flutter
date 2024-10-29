import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ar_draw/screen/permission/permissionController.dart';

class PermissionCamera extends GetView {
  PermissonController permissonController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, actions: [
        InkWell(
          onTap: () {
            // Get.toNamed(AppRouter.INTRO_PAGE);
          },
          child: InkWell(
              onTap: () {
                // if(permissonController.cameraPermission.value && permissonController.storagePermission.value){
                //   Get.offNamed(AppRouter.HOME_PAGE);
                // }
                // else{

                // }
              },
              child: const Icon(Icons.close_outlined)),
        ),
        const SizedBox(
          width: 20,
        )
      ]),
      body: Column(children: [
        const SizedBox(
          height: 16,
        ),
        Container(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/images/cameraImg.png",
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: const Text(
            "Needs access to camera & microphone ",
            style: TextStyle(
              color: Color(0xFF1D1D1D),
              fontFamily: "ComicSansMS",
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: const Text(
            "To start using the camera, please turn on access your camera and microphone",
            style: TextStyle(
              color: Color(0xFF464141),
              fontFamily: "ComicSansMS",
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF2970E4))),
            onPressed: () {
              permissonController.requestCameraPermission( context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                "Grant access",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "ComicSansMS",
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
