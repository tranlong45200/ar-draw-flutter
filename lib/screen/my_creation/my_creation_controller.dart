import 'dart:io';
import 'package:get/get.dart';
import 'package:ar_draw/core/utils/get_file.dart';


class MyCreationController extends GetxController{
  RxList<File> listFile = <File>[].obs;
@override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    listFile.value = await getImagesAndVideosFromAlbum();
  }

}