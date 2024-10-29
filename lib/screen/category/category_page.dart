import 'package:ar_draw/screen/category/category_controller.dart';
import 'package:ar_draw/screen/category/view/category__tab_page.dart';
import 'package:ar_draw/screen/category/view/custom_appbar.dart';
import 'package:ar_draw/screen/category/view/web_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shareController.dart';

class CategoryPage extends GetWidget {
  CategoryPage({super.key});

  CategoryController categoryController = Get.find();
  ShareController shareController = Get.put(ShareController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5FA),
      appBar: CustomAppBar(
        title: shareController.isShowCamera ? 'Creative Sketch' : 'Trace Image',
        onBackPress: () {
          print('Back button pressed');
        },
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search button pressed');
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: categoryController.tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CategoryTabPage(),
          WebPage(),
        ],
      ),
    );
  }
}
