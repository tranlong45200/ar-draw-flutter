import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var index = 1.obs;

  late Rx<TabController> tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this).obs;
  }
}
