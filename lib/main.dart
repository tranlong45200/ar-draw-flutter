import 'package:ar_draw/appRouter.dart';
import 'package:ar_draw/screen/category/category_bin%C4%91ing.dart';
import 'package:ar_draw/screen/category/category_page.dart';
import 'package:ar_draw/screen/home/home.dart';
import 'package:ar_draw/screen/home/home_binding.dart';
import 'package:ar_draw/screen/shareBinding.dart';
import 'package:ar_draw/screen/splashPage/splashBinding.dart';
import 'package:ar_draw/screen/splashPage/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  runApp(MyAppGetX());
}

class MyAppGetX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: DependenciesBinding(),
      initialRoute: AppRouter.SPLASH_PAGE,
      getPages: [
        GetPage(
            name: AppRouter.SPLASH_PAGE,
            page: () => Splash(),
            binding: SplashBindind()),
        GetPage(
            name: AppRouter.HOME_PAGE,
            page: () => HomePage(),
            binding: HomeBinding()),
        GetPage(
            name: AppRouter.CATEGORY_PAGE,
            page: () => CategoryPage(),
            binding: CategoryBinding()),
      ],
    );
  }
}

class DependenciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareBinding());
  }
}
