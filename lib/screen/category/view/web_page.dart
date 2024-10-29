import 'dart:convert';
import 'package:get/get.dart';
import '../../../appRouter.dart';
import '../../shareController.dart';
import '../category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPage extends GetWidget {
  CategoryController categoryController = Get.find();
  ShareController shareController = Get.find();

  WebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.parse(
              'https://www.bing.com/images/search?q=easy+line+drawings&form=HDRSC3&first=1'))),
      onWebViewCreated: (InAppWebViewController controller) {
        categoryController.webViewController = controller;
      },
      onLoadStart: (InAppWebViewController controller, Uri? url) {
        // Do something when the page starts loading
      },
      onLoadStop: (InAppWebViewController controller, Uri? url) {
        // Do something when the page finishes loading
      },
      onLongPressHitTestResult: (InAppWebViewController controller,
          InAppWebViewHitTestResult hitTestResult) async {
        // Disable default long press behavior in WebView
    //     controller.evaluateJavascript(source: '''
    //   document.addEventListener('contextmenu', function(event) {
    //     event.preventDefault();
    //   });
    // ''');

        controller.platform.clearFocus();

        // Your Flutter code for handling long press
        _showImageDialog(hitTestResult.extra ?? "", context);
      },
    );
  }

  void _showImageDialog(String base64Image, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Select an option',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        fontFamily: "ComicSansMS",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Container(
                      color: Colors.grey.shade300,
                      height: 1,
                      padding: EdgeInsets.only(left: 10, right: 10),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Select this image to draw?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: "ComicSansMS",
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "ComicSansMS",
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextButton(
                              onPressed: () {
                                print("object");
                                Navigator.of(context).pop(); // Close the dialog
                                shareController.base64Image.value =
                                    base64Image.toString().split(',')[1];
                                Get.toNamed(AppRouter.IMAGE_CONTINUE_PAGE);
                              },
                              child: const Text(
                                'Select Image',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "ComicSansMS",
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
