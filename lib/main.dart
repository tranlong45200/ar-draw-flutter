import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ar_draw/appRouter.dart';
import 'package:ar_draw/generated/l10n.dart';
import 'package:ar_draw/screen/shareController.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyAppGetX());
}

class MyAppGetX extends StatelessWidget {
  ShareController shareController = Get.put(ShareController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> GetMaterialApp(
        enableLog: true,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale:Locale(shareController.language.value),
        supportedLocales: const [
          Locale('en'),
          Locale('es'),
          Locale('fr'),
          Locale('hi'),
          Locale('pt'),
        ],
        initialBinding: DependenciesBinding(),
        initialRoute: AppRouter.SPLASH_PAGE,
        getPages: AppRouter.listGetPage
      ),
    );
  }
}

class DependenciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShareController());
  }
}
