import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ar_draw/screen/my_creation/view/creationItem.dart';
import 'package:ar_draw/screen/my_creation/my_creation_controller.dart';

class MyCreationPage extends GetView {
  MyCreationController myCreationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "My Creation",
          style: TextStyle(
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
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Obx(
            () => myCreationController.listFile.value.isEmpty
                ? ItemEx()
                : Column(children: [
                    ...myCreationController.listFile.value.map((e) {
                      // bool isVideo = e.path.toLowerCase().endsWith('.mp4');
                      // if (isVideo) {
                      //   // Đối với video, bạn có thể sử dụng một thư viện khác để lấy thời lượng
                      //   int videoDurationInSeconds = getVideoDuration(e);
                      //   print('Thời lượng video: $videoDurationInSeconds giây');
                      // }
                      return Column(
                        children: [
                          CreationItem(
                            file: e,
                            creationTime: e.lastModifiedSync(),
                            fileName: e.uri.pathSegments.last,
                          ),
                          SizedBox(
                            height: 16,
                          )
                        ],
                      );
                    })
                  ]),
          ),
        ),
      ),
    );
  }

  Widget ItemEx() {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
          color: Color(0xFFDEE7F8),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Image.asset(
              "assets/images/creation_demo.png",
            ),
          ),
          SizedBox(
            width: 8,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Video1",
                style: TextStyle(
                  color: Color(0xFF2970E4),
                  fontFamily: "ComicSansMS",
                  fontSize: 22,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "10-10-2023",
                style: TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontFamily: "ComicSansMS",
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Video1",
                style: TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontFamily: "ComicSansMS",
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
