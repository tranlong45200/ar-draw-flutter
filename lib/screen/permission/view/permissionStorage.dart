import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ar_draw/screen/permission/permissionController.dart';

class PermissionStorage extends GetView {
  PermissonController permissonController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, actions: [
        InkWell(
          onTap: () {
          
          },
          child: InkWell(
              onTap: () {
              
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
            "assets/images/library.png",
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: const Text(
            "Needs access to Library ",
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
            "Please allow access to the gallery for beautiful images",
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
          height: 16,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF2970E4))),
            onPressed: () {
              permissonController.requestStoragePermission(context);

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
