import 'package:ar_draw/appRouter.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controllerText;
  late Animation<double> animation;
  late Animation<Offset> textAnimation;
  late AnimationController controllerProcess;
  late Animation<double> animationProcess;
  var isViewNameApp = false.obs;
  var isViewNav = false.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 5), () {
      // Navigate to your desired page using Navigator
      Get.offNamed(AppRouter.HOME_PAGE);
    });

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    controllerProcess = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    controllerText = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    animationProcess =
        Tween<double>(begin: 0.0, end: 1.0).animate(controllerProcess);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    textAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Bắt đầu từ đáy của chữ
      end: const Offset(0.0, 0.0), // Kết thúc ở trên cùng của chữ
    ).animate(
      CurvedAnimation(
        parent: controllerText,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    controllerProcess.forward();
    controller.forward();
    controllerText.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isViewNameApp.value = true;
      }
    });
    textAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isViewNav.value = true;
      }
    });
    animationProcess.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });
  }
}
