import 'package:ar_draw/screen/home/home.dart';
import 'package:ar_draw/screen/intro/introPage.dart';
import 'package:ar_draw/screen/home/home_binding.dart';
import 'package:ar_draw/screen/datail/detail_page.dart';
import 'package:ar_draw/screen/intro/introBinding.dart';
import 'package:ar_draw/screen/make_text/make_text_binding.dart';
import 'package:ar_draw/screen/make_text/make_text_page.dart';
import 'package:ar_draw/screen/setting/setting_page.dart';
import 'package:ar_draw/screen/datail/detail_binding.dart';
import 'package:ar_draw/screen/language/languagePage.dart';
import 'package:ar_draw/screen/splashPage/splashPage.dart';
import 'package:ar_draw/screen/category/category_page.dart';
import 'package:ar_draw/screen/splashPage/splashBinding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ar_draw/screen/permission/permissionPage.dart';
import 'package:ar_draw/screen/category_item/category_item.dart';
import 'package:ar_draw/screen/my_creation/my_creation_page.dart';
import 'package:ar_draw/screen/permission/permissionBinding.dart';
import 'package:ar_draw/screen/category/category_bin%C4%91ing.dart';
import 'package:ar_draw/screen/my_creation/my_creation_binding.dart';
import 'package:ar_draw/screen/permission/view/permissionCamera.dart';
import 'package:ar_draw/screen/permission/view/permissionStorage.dart';
import 'package:ar_draw/screen/image_continue/image_contnue_page.dart';
import 'package:ar_draw/screen/tutorial/tutorial_trace/tutorial_trace.dart';
import 'package:ar_draw/screen/tutorial/tutorial_sketch/tutorial_sketch.dart';
import 'package:ar_draw/screen/tutorial/tutorial_trace/tutorial_trace_binding.dart';
import 'package:ar_draw/screen/tutorial/tutorial_sketch/tutorial_sketch_binding.dart';

class AppRouter {
  static const SPLASH_PAGE = "/splash";
  static const HOME_PAGE = "/home";
  static const CATEGORY_PAGE = "/category";
  static const CATEGORY_ITEM_PAGE = "/category_item";
  static const IMAGE_CONTINUE_PAGE = "/image_continue";
  static const DETAIL_PAGE = "/detail";
  static const TUTORIAL_SKETCH_PAGE = "/tutorial_sketch";
  static const TUTORIAL_TRACE_PAGE = "/tutorial_trace";
  static const SET_LANGUAGE_PAGE = "/set_laguage";
  static const INTRO_PAGE = "/intro";
  static const PERMISSON_PAGE = "/permission";
  static const PERMISSON_CAMERA_PAGE = "/permission_camera";
  static const PERMISSON_STORAGE_PAGE = "/permission_storage";
  static const MY_CREATION_PAGE = "/my_creation";
  static const SETTING_PAGE = "/setting_page";
  static const MAKE_TEXT = "/make_text_page";

  static List<GetPage<dynamic>> listGetPage = [
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
    GetPage(
        name: AppRouter.DETAIL_PAGE,
        page: () => DetailPage(),
        binding: DetailBinding()),
    GetPage(
      name: AppRouter.CATEGORY_ITEM_PAGE,
      page: () => CategoryItemPage(),
    ),
    GetPage(
      name: AppRouter.IMAGE_CONTINUE_PAGE,
      page: () => ImageContinuePage(),
    ),
    GetPage(
        name: AppRouter.TUTORIAL_SKETCH_PAGE,
        page: () => TutorialSketch(),
        binding: TutorialSketchBinding()),
    GetPage(
        name: AppRouter.TUTORIAL_TRACE_PAGE,
        page: () => TutorialTrace(),
        binding: TutorialTraceBinding()),
    GetPage(
      name: AppRouter.SET_LANGUAGE_PAGE,
      page: () => LanguagePage(),
    ),
    GetPage(
        name: AppRouter.INTRO_PAGE,
        page: () => IntroPage(),
        binding: IntroBinding()),
    GetPage(
        name: AppRouter.PERMISSON_PAGE,
        page: () => PermissionPage(),
        binding: PermissonBinding()),
    GetPage(
        name: AppRouter.PERMISSON_CAMERA_PAGE,
        page: () => PermissionCamera(),
        binding: PermissonBinding()),
    GetPage(
        name: AppRouter.PERMISSON_STORAGE_PAGE,
        page: () => PermissionStorage(),
        binding: PermissonBinding()),
    GetPage(
        name: AppRouter.MY_CREATION_PAGE,
        page: () => MyCreationPage(),
        binding: MyCreationBinding()),
    GetPage(
      name: AppRouter.SETTING_PAGE,
      page: () => SettingPage(),
    ),
    GetPage(
      name: AppRouter.MAKE_TEXT,
      page: () => MakeTextPage(),
      binding: MakeTextBinding(),
    )
  ];
}
