import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' hide Size;
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ar_draw/model/app_colors.dart';
import 'package:ar_draw/core/utils/get_path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ar_draw/screen/shareController.dart';
import 'package:ar_draw/component/overlayed_widget.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ar_draw/screen/datail/detail_controller.dart';

class DetailPage extends GetWidget {
  DetailPage({super.key});

  DetailController detailController = Get.find();
  ShareController shareController = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: shareController.isShowCamera? detailController.initCamera() :detailController.initBackground(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          return Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: double.infinity,
                          child: !shareController.isShowCamera
                              ? Container(
                                  color: Colors.white,
                                )
                              : CameraPreview(detailController.controller),
                        ),
                      ),
                      OverlayedWidget(
                        widgetChild: Container(
                          child: Obx(
                            () => Transform.flip(
                              flipX: detailController.mirror.value,
                              child: Obx(() => Opacity(
                                    opacity: detailController
                                        .valueOpacityAmimated.value,
                                    child: Image.memory(

                                      base64.decode(shareController.base64Image
                                          .toString()),
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width/2,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: kTextTabBarHeight,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back(); //ff(AppRouter.DETAIL_PAGE);
                                  },
                                  child: const CircleAvatar(
                                      backgroundColor: AppColor.backgroundColor,
                                      child: Icon(
                                        Icons.close_sharp,
                                        color: Color(0xFF2970E4),
                                      )),
                                ),
                                InkWell(
                                  onTap: () => detailController.changeLock(),
                                  child: Obx(
                                    () => CircleAvatar(
                                      backgroundColor:  AppColor.backgroundColor,
                                      child: detailController.lock.value
                                          ? SvgPicture.asset(
                                              "assets/svg/unlock.svg")
                                          : SvgPicture.asset(
                                              "assets/svg/lock.svg"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: const BoxDecoration(
                                  color:  AppColor.backgroundColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24))),
                              child: Row(
                                children: [
                                  InkWell(
                                    // onTap: () =>
                                    // detailController.changeOpacityEdit(),
                                    child:
                                        // Obx(
                                        //   () =>
                                        SvgPicture.asset(
                                      "assets/svg/mo.svg",
                                      color: Colors.blue,
                                    ),
                                  ),
                                  // ),
                                  Obx(
                                    () => Expanded(
                                      child: Slider(
                                        activeColor: const Color(0xFF2970E4),
                                        inactiveColor: Colors.white,
                                        value:
                                            detailController.valueOpacity.value,
                                        autofocus: true,
                                        onChanged: (newValue) {
                                          detailController
                                              .changeOpacity(newValue);
                                        },
                                        onChangeEnd: (value) {
                                          detailController
                                              .changeOpacityAnimated(value);
                                        },
                                        min: 0.1,
                                        max: 1.0,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        detailController.changeOpacityEdit(),
                                    child: SvgPicture.asset(
                                      "assets/svg/eye-off.svg",
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: !shareController.isShowCamera ? 20 : 0,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Visibility(
                            visible: shareController.isShowCamera,
                            child: Container(
                              color:  AppColor.backgroundColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => InkWell(
                                      onTap: () => detailController
                                              .isRecording.value
                                          ? detailController
                                              .stopReCording(context)
                                          : detailController.startRecording(),
                                      child: detailController.isRecording.value
                                          ? Column(
                                              children: [
                                                Text(
                                                  "${formatDuration(detailController.runningTime.value)}",
                                                  style: const TextStyle(
                                                    color: Color(0xFF2970E4),
                                                    fontFamily: "ComicSansMS",
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                    "assets/svg/record.svg")
                                              ],
                                            )
                                          : CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: SvgPicture.asset(
                                                  "assets/svg/video.svg"),
                                            ),
                                    ),
                                  ),
                                  Obx(
                                    () => InkWell(
                                      onTap: () async {
                                        if (!detailController
                                            .isRecording.value) {
                                          await capturePhoto(context);
                                        }
                                      },
                                      child: Opacity(
                                        opacity:
                                            detailController.isRecording.value
                                                ? 0.5
                                                : 1,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: SvgPicture.asset(
                                              "assets/svg/camera.svg"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      try {
                                        // Kiểm tra trạng thái flash hiện tại
                                        
                                        if (detailController
                                                .controller.value.flashMode ==
                                            FlashMode.off || !detailController.flash.value) {
                                          // Nếu flash đang tắt, bật nó lên
                                          await detailController.controller
                                              .setFlashMode(FlashMode.torch);
                                              detailController.changeFlash(true);
                                        } else {
                                          // Nếu flash đang bật, tắt nó đi
                                          await detailController.controller
                                              .setFlashMode(FlashMode.off);
                                              detailController.changeFlash(false);
                                        }
                                        detailController.flash;
                                      } catch (e) {
                                        print(
                                            'Lỗi khi thay đổi trạng thái flash: $e');
                                      }
                                    },
                                    child: Obx(
                                      () => CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: detailController.flash.value
                                            ? SvgPicture.asset(
                                                "assets/svg/flashOn.svg")
                                            : SvgPicture.asset(
                                                "assets/svg/flashOff.svg"),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        detailController.changeMirror(),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: SvgPicture.asset(
                                          "assets/svg/flip.svg"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Future<void> capturePhoto(BuildContext context) async {
    try {
      // Kiểm tra xem CameraController đã được khởi tạo chưa
      if (detailController.controller != null) {
        String imagePath = await getMediaPath('image');
        final XFile photo = await detailController.controller.takePicture();
        final File imageFile = File(photo.path);
        await imageFile.rename(imagePath);
        await ImageGallerySaver.saveFile(imagePath);
        print('Đã chụp ảnh thành công: ${imagePath}');
        _showAlertDialog(context, 'Đã chụp ảnh thành công: ${imagePath}');
      }
    } catch (e) {
      print('Lỗi khi chụp ảnh: $e');
    }
  }

  Future<void> _showAlertDialog(BuildContext context, String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông Báo'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  String formatDuration(Duration duration) {
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
}
