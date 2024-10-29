import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import '../appRouter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/data/entiti/Category.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ar_draw/model/data/network/api_utils.dart';
import 'package:ar_draw/device/services/storage_service.dart';

class ShareController extends GetxController {
  var font="".obs;
  var base64Image = "".obs;
  var getDataDone = false.obs;
  RxList<Category> categories = <Category>[].obs;
  var categoriItemName = "".obs;
  RxList<CategoryItem> categoriItem = <CategoryItem>[].obs;
  var isShowCamera = false;
  RxString language = "en".obs;
  RxBool isUsed = false.obs;
  var demoText = "AR VR DRAW".obs;
  List<String> fontNames = <String>[];
  final captureKey = GlobalKey();

  Uint8List? capturedImage;

  void captureAndConvertToBase64() async {
    RenderRepaintBoundary boundary = captureKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      Uint8List pngBytes = byteData.buffer.asUint8List();
      capturedImage = pngBytes;
      update(); // Trigger a rebuild to display the captured image
      base64Image.value = base64Encode(pngBytes);
      print('Base64 Image: $base64Image');
    }

    Get.offNamed(AppRouter.DETAIL_PAGE);
  }

  Future<void> loadFontNames() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    fontNames = manifestMap.keys
        .where((String key) =>
    key.startsWith('assets/font_view/') && key.endsWith('.ttf'))
        .map((String key) =>
        key.replaceAll('assets/font_view/', '').replaceAll('.ttf', ''))
        .toList();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    print("creat share controller");
    language.value =
        await StorageService.getString("language", defaultValue: "en");
    isUsed.value =
        await StorageService.getString("isUsed", defaultValue: "0") == "1"
            ? true
            : false;
    print("check data ${isUsed.value}");

    getAppdata();
    loadFontNames();
  }

  Future<void> setLanguage(String languageString) async {
    language.value = languageString;
    await StorageService.saveString("language", languageString);
  }

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Convert the picked image to bytes
      Uint8List pickedBytes = await pickedFile.readAsBytes();
      // Encode the bytes to base64
      base64Image.value = base64Encode(pickedBytes);
      Get.toNamed(AppRouter.DETAIL_PAGE);
    }
  }

  Future<void> getAppdata() async {
    try {
      var jsonResponse = await ApiUtils.fetchData(
          "https://bitbucket.org/nmh-global/app192/raw/6d9238df7558e662363daac138dceaca87fe12cb/config.json");

      print("xxxxx $jsonResponse");

      List<dynamic> jsonData = jsonDecode(jsonResponse.toString());

      categories.value =
          jsonData.map((json) => Category.fromJson(json)).toList();

      for (Category category in categories.value) {
        print('Category: ${category.name}');
        print('Image: ${category.image}');
        for (CategoryItem item in category.categories) {
          print('  Is Premium: ${item.isPremium}');
          print('  Image: ${item.image}');
          print('  Is Favorite: ${item.isFavorite ?? false}');
        }
        print('\n');
      }
    } catch (error) {
      print('Errorcxxx: $error');
    }

    Future.delayed(Duration(seconds: 3), () {
      // Navigate to your desired page using Navigator
      isUsed.value ? Get.offNamed(AppRouter.INTRO_PAGE):
      Get.offNamed(AppRouter.SET_LANGUAGE_PAGE,arguments: false);
    });
  }

  Future<void> loadImageBase64FromUrl(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      // Convert the image data to Base64
      final base64Data = base64Encode(response.bodyBytes);
      base64Image.value = base64Data;
      print("base64Data $base64Data");
    } else {
      print('Failed to load image. Status code: ${response.statusCode}');
    }
  }

  Future<void> loadBase64AndStartContinue(String imageUrl) async {
    await loadImageBase64FromUrl(imageUrl);
    Get.toNamed(AppRouter.IMAGE_CONTINUE_PAGE);
  }
}
