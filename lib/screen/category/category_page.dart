import 'package:ar_draw/screen/category/category_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../model/constanst.dart';

class CategoryPage extends GetWidget {
  CategoryPage({super.key});

  CategoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Custom App Bar',
        onBackPress: () {
          // Implement back button functionality
          print('Back button pressed');
        },
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
              print('Search button pressed');
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: controller.tabController.value,
        children: [
          Center(child: Text('Tab 1')),
          Center(child: Text('Tab 2')),
          Center(child: Text('Tab 3')),
          Center(child: Text('Tab 4')),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPress;
  final List<Widget> actions;

  CustomAppBar({
    required this.title,
    required this.onBackPress,
    this.actions = const [],
  });

  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onBackPress,
      ),
      title: Text(title),
      bottom: TabBar(
        controller: controller.tabController.value,
        tabs: [
          Tab(text: 'Tab 1'),
          Tab(text: 'Tab 2'),
          Tab(text: 'Tab 3'),
          Tab(text: 'Tab 4'),
        ],
      ),
      actions: actions,
      backgroundColor: Colors.blue, // Customize background color
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 50);
}
