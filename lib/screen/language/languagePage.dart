import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:ar_draw/appRouter.dart';
import 'package:ar_draw/generated/l10n.dart';
import 'package:ar_draw/model/app_colors.dart';
import 'package:ar_draw/screen/shareController.dart';
import 'package:ar_draw/screen/language/entities/laguage_type.dart';
// ignore_for_file: prefer_const_constructors

class LanguagePage extends GetView {
  bool receivedData = Get.arguments;
  ShareController shareController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            S.of(context).language,
            style: TextStyle(
              color: Color(0xFF2970E4),
              fontFamily: "ComicSansMS",
              fontSize: 22,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading:receivedData? Icon(Icons.arrow_back_ios,color:  Color(0xFF2970E4),): Container() ,
          actions: [
            InkWell(
              onTap: () {
               receivedData?Get.offAllNamed(AppRouter.HOME_PAGE):  Get.offNamed(AppRouter.INTRO_PAGE);
              },
              child: SvgPicture.asset(
                 "assets/svg/check.svg",
                height: 28,
              ),
            ),
            SizedBox(
              width: 16,
            )
          ]),
          
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(
            height: 16,
          ),
          Obx(
            () => LanguaugeCheckBox(
              isSelected: shareController.language.value == "en",
              languageType: LanguageType.en,
              iconAssets: "assets/images/english.png",
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Obx(
            () => LanguaugeCheckBox(
                isSelected: shareController.language.value == "es",
                iconAssets: "assets/images/spain.png",
                languageType: LanguageType.es),
          ),
          SizedBox(
            height: 16,
          ),
          Obx(
            () => LanguaugeCheckBox(
                isSelected: shareController.language.value == "fr",
                iconAssets: "assets/images/france.png",
                languageType: LanguageType.fr),
          ),
          SizedBox(
            height: 16,
          ),
          Obx(
            () => LanguaugeCheckBox(
                isSelected: shareController.language.value == "hi",
                iconAssets: "assets/images/india.png",
                languageType: LanguageType.hi),
          ),
          SizedBox(
            height: 16,
          ),
          Obx(
            () => LanguaugeCheckBox(
                isSelected: shareController.language.value == "pt",
                iconAssets: "assets/images/portugal.png",
                languageType: LanguageType.pt),
          ),
        ]),
      ),
    );
  }

  Widget LanguaugeCheckBox({
    required bool? isSelected,
    required String iconAssets,
    required LanguageType languageType,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColor.backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Image.asset(
                  iconAssets,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                languageType.label,
                style: const TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontFamily: "ComicSansMS",
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Radio<String>(
            value: languageType.value,
            groupValue: shareController.language.value,
            activeColor: Colors.blue,
            onChanged: (value) {
              shareController.setLanguage(value ?? "en");
            },
          )
        ],
      ),
    );
  }
}
