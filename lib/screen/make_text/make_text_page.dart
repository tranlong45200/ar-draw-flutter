import 'dart:convert';

import 'package:ar_draw/screen/make_text/make_text_controller.dart';
import 'package:ar_draw/screen/shareController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MakeTextPage extends GetWidget {
  ShareController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    if (controller.font.value == "")
      controller.font.value = controller.fontNames[0];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Get.back();
            // Add your back button functionality here
          },
        ),
        title: const Text(
          "Write Text",
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.blue),
            onPressed: () {
              controller.captureAndConvertToBase64();
              // Add your tick/check button functionality here
            },
          ),
        ],
        backgroundColor:
            Colors.white, // You can customize the background color if needed
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: Center(
              child: Obx(() => RepaintBoundary(
                    key: controller.captureKey,
                    child: TextField(
                      controller: TextEditingController(
                          text: controller.demoText.value),
                      textAlign: TextAlign.center, // Căn giữa ngang
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: controller.font.value),
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (String fontName in controller.fontNames)
                    InkWell(
                      onTap: () {
                        controller.font.value = fontName;
                      },
                      child: Obx(() => FontCard(
                            context,
                            fontName,
                            controller.demoText.value,
                          )),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget FontCard(BuildContext context, String fontName, String demoText) {
    // print("build card font: $fontName");
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.5), // Blue background color
        borderRadius:
            BorderRadius.circular(15), // Rounded corners with a radius of 15
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            demoText,
            style: TextStyle(
                fontSize: 20, fontFamily: fontName, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
