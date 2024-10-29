import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ar_draw/core/utils/get_path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class DetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var scale = 1.0.obs;
  var previousScale = 1.0.obs;
  var offset = Offset.zero.obs;
  RxBool isRecording = false.obs;
  RxBool flash = false.obs;
  RxBool mirror = false.obs;
  RxBool lock = false.obs;
  RxBool opacity = false.obs;
  RxDouble valueOpacity = 0.5.obs;
  RxDouble valueOpacityAmimated = 0.5.obs;
  late CameraController controller;
  late List<CameraDescription> cameras;
  late AnimationController animaterController;
  Rx<Animation<double>?> opacityAnimated = Rx<Animation<double>?>(null);
  Rx<Duration> runningTime = Duration(seconds: 0).obs;
  late Timer timer;


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    cameras.clear();
    // lock = false.obs;
  }

  @override
  void onClose() {

    super.onClose();
  }

  void changeFlash(bool isFlash) {
    flash.value = isFlash;
  }
  void changeLock() {
    lock.value = !lock.value;
  }

  void changeOpacityEdit() {
    opacity.value = !opacity.value;
  }

  void changeOpacity(double opacityValue) {
    valueOpacity.value = opacityValue;

  }

  void changeOpacityAnimated(double opacityValue) {
    valueOpacityAmimated.value = opacityValue;
  }

  void changeMirror() {
    mirror.value = !mirror.value;
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();

    if (cameras.isNotEmpty) {
      controller = CameraController(cameras[0], ResolutionPreset.ultraHigh,
          enableAudio: true);

      await controller.initialize();
    } else {
      // Handle the case where no cameras are available
      // throw CameraException('No cameras available');
    }
  }
  Future<void> initBackground() async {
    print("initBackground");
  }

  void startRecording() async {
    if (controller != null) {
      try {
        if (!controller.value!.isRecordingVideo) {
           controller.startVideoRecording();
          isRecording.value = true;
          print('Đã bắt đầu ghi video...');
           DateTime recordingStartTime = DateTime.now();
          // Bắt đầu Timer để cập nhật thời gian đang chạy quay
          timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
            runningTime.value =
                DateTime.now().difference(recordingStartTime);
          });

        }
      } catch (e) {
        print('Lỗi khi ghi video: $e');
      }

    }
  }

  Future<void> stopReCording(BuildContext buildContext) async {
    final XFile? recordedVideo = await controller.stopVideoRecording();
    String videoPath = await getMediaPath('video');
    if(recordedVideo != null){
      final File file = File(recordedVideo.path);
    await file.rename(videoPath);
    await ImageGallerySaver.saveFile(videoPath);
    print('Đã kết thúc ghi video: ${videoPath}');
    isRecording.value = false;
    runningTime.value = Duration(seconds: 0);
    _showAlertDialog(buildContext,"${videoPath} ");
    timer.cancel();
    }
    
   
  }

  String formatDuration(Duration duration) {
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }


  Future<void> _showAlertDialog(BuildContext context, String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Video save to :'),
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
}
