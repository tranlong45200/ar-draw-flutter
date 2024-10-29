import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ar_draw/screen/datail/detail_controller.dart';
import 'package:ar_draw/component/matrix_gesture_detector.dart';

class OverlayedWidget extends GetWidget {
  Widget widgetChild;
  bool mirror;
  DetailController detailController = Get.find();
  OverlayedWidget({super.key, required this.widgetChild, this.mirror = false});
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());

    return Positioned.fill(
      child: Obx(
          ()=> MatrixGestureDetector(
            onMatrixUpdate: (matrix, tm, sm, rm) {
              notifier.value = matrix;
            },
            onScaleStart: () {},
            onScaleEnd: () {},
            clipChild: false,
              shouldRotate: !detailController.lock.value,
              shouldScale: !detailController.lock.value,
              shouldTranslate: !detailController.lock.value,
            child: AnimatedBuilder(
              animation: notifier,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  transform: notifier.value,
                  child: FittedBox(
                    fit: BoxFit.none,
                    child: widgetChild,
                  ),
                );
              },
            )),
      ),
    );
  }
}
