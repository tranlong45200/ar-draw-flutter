import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ar_draw/appRouter.dart';
import 'package:ar_draw/screen/shareController.dart';
// ignore_for_file: invalid_use_of_protected_member

class CategoryTabPage extends GetWidget {
  ShareController shareController = Get.put(ShareController());

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Số ảnh trên mỗi hàng
            crossAxisSpacing: 16.0, // Khoảng cách giữa các ảnh theo chiều ngang
            mainAxisSpacing: 16.0, // Khoảng cách giữa các ảnh theo chiều dọc
          ),
          itemCount: shareController.categories.value.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: InkWell(
                onTap: () {
                  shareController.categoriItem.value =
                      shareController.categories.value[index].categories;
                  shareController.categoriItemName.value =
                      shareController.categories.value[index].name;
                  Get.toNamed(AppRouter.CATEGORY_ITEM_PAGE);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:BorderRadius.all(Radius.circular(16)),
                    color: Colors.white

                  ),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        shareController.categories.value[index].image,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Image.network(
                        shareController.categories.value[0].image,
                        fit: BoxFit.cover,);
                        },
                      ),
                      Text(
                        shareController.categories.value[index].name,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      
      ),
    );
  }
}
