import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/src/in_app_webview/in_app_webview_controller.dart';


class CategoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var index = 1.obs;
  late TabController tabController;
  late final WebViewController webController;
  late final InAppWebViewController webViewController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFF0000));
    webController.loadRequest(Uri.parse(
      'https://www.bing.com/images/search?q=easy+line+drawings&form=HDRSC3&first=1'));

    webController.reactive.addListener(() {});
  }
}
