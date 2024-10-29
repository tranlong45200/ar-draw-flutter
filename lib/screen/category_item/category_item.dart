import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ar_draw/screen/shareController.dart';

class CategoryItemPage extends GetWidget {
  ShareController shareController = Get.put(ShareController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          shareController.categoriItemName.value,
          style: const TextStyle(
            color: Color(0xFF2970E4),
            fontFamily: "ComicSansMS",
            fontSize: 22,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFF2970E4)),
      ),
      body: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Obx(
          () => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // Số ảnh trên mỗi hàng
              crossAxisSpacing: 16.0,
              // Khoảng cách giữa các ảnh theo chiều ngang
              mainAxisSpacing: 16.0, // Khoảng cách giữa các ảnh theo chiều dọc
            ),
            itemCount: shareController.categoriItem.value.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: InkWell(
                  onTap: () async {
                    await shareController.loadBase64AndStartContinue(
                        shareController.categoriItem.value[index].image);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.white),
                    padding: EdgeInsets.all(8),
                    child: Image.network(
                      shareController.categoriItem.value[index].image,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.network(
                          shareController.categoriItem.value[0].image,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
