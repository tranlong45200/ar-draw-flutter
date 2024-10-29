import 'dart:convert';

import 'package:ar_draw/appRouter.dart';
import 'package:ar_draw/model/constanst.dart';
import 'package:ar_draw/screen/shareController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageContinuePage extends GetWidget {
  ShareController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Column(
          children: [
            Expanded(
              child: Image.memory(
                base64.decode(controller.base64Image.value.toString()),
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.offNamed(AppRouter.DETAIL_PAGE);
                  // Add your logic for the Continue button here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Background color
                  onPrimary: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
