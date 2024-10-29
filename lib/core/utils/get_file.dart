import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<List<File>> getImagesAndVideosFromAlbum() async {
  try {
    // Lấy đường dẫn thư mục ảnh và video trong thư viện
    Directory appDocumentsDirectory = await getLibraryDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String albumDirectoryName = 'ar_vr_drawing';
    String albumDirectoryPath = '$appDocumentsPath/$albumDirectoryName';

    // Kiểm tra xem thư mục đã tồn tại chưa
    if (!(await Directory(albumDirectoryPath).exists())) {
      print('Thư mục $albumDirectoryName không tồn tại');
      return [];
    }

    // Lấy danh sách các file trong thư mục
    List<File> imagesAndVideos = [];
    Directory(albumDirectoryPath).listSync().forEach((entity) {
      if (entity is File) {
        imagesAndVideos.add(entity);
      }
    });

    return imagesAndVideos;
  } catch (e) {
    print('Lỗi khi lấy danh sách ảnh và video từ album: $e');
    return [];
  }
}
Future<void> deleteImage(File image) async {
  try {
    await image.delete();
    print('Đã xóa ảnh thành công');
  } catch (e) {
    print('Lỗi khi xóa ảnh: $e');
  }
}