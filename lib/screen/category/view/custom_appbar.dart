import 'package:ar_draw/appRouter.dart';
import 'package:get/get.dart';
import '../category_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../model/constanst.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ar_draw/screen/shareController.dart';

class CustomAppBar extends GetWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPress;
  final List<Widget> actions;

  CustomAppBar({
    required this.title,
    required this.onBackPress,
    this.actions = const [],
  });

  CategoryController controller = Get.find();
  ShareController shareController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blue),
          // Set the back button icon color to blue
          title: const Text(
            "Creative Sketch",
            style:
                TextStyle(color: Colors.blue), // Set your desired title color
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: AppValues.padding / 2),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Color.fromRGBO(222, 231, 248, 1.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTab("Category", "assets/svg/category_white.svg", 1),
                    buildTab("Browser", "assets/svg/web.svg", 2),
                    buildTab("Recent Image", "assets/svg/Intersect.svg", 3),
                    buildTab("Text", "assets/svg/text-selection.svg", 4),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // Helper function to create a tab
  Widget buildTab(String title, String iconAsset, int index) {
    const activeColor = Colors.white;
    const inactiveColor = Color(0xFF2970E4);

    return InkWell(
      onTap: () {
        if (index == 4) {
          print("start make text");
          Get.toNamed(AppRouter.MAKE_TEXT);
        }
        if (index == 3) {
          print("getImage");
          shareController.getImage();
        }
        if (index <= 2) {
          controller.index.value = index;
          controller.tabController.index = index - 1;
        }
      },
      child: Column(
        children: [
          Obx(() => Container(
                padding: const EdgeInsets.all(AppValues.padding / 2),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: controller.index.value == index
                      ? const Color(0xFF2970E4)
                      : Colors.white,
                ),
                child: SvgPicture.asset(
                  iconAsset,
                  height: 24,
                  color: controller.index.value == index
                      ? activeColor
                      : inactiveColor,
                ),
              )),
          const SizedBox(height: 6), // Adjust spacing between icon and text
          Obx(() => Text(
                title,
                style: TextStyle(
                  color: inactiveColor,
                  fontWeight: controller.index.value == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 120);
}
