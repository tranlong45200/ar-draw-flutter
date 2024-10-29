import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> getMediaPath(String mediaType) async {
  // Lấy thư mục vĩnh viễn để lưu trữ hình ảnh và video
  Directory appDocumentsDirectory = await getLibraryDirectory();
  String appDocumentsPath = appDocumentsDirectory.path;

  // Tạo một thư mục con trong thư mục vĩnh viễn (có thể đặt tên theo nhu cầu của bạn)
  String mediaDirectoryName = 'ar_vr_drawing';
  String mediaDirectoryPath = '$appDocumentsPath/$mediaDirectoryName';

  // Kiểm tra xem thư mục đã tồn tại chưa
  if (!(await Directory(mediaDirectoryPath).exists())) {
    // Nếu chưa tồn tại, tạo thư mục mới
    await Directory(mediaDirectoryPath).create(recursive: true);
  }

  // Tạo tên file ngẫu nhiên cho hình ảnh hoặc video
  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  String mediaFileName;

  if (mediaType == 'image') {
    mediaFileName = 'IMAGE_$timestamp.jpg';
  } else if (mediaType == 'video') {
    mediaFileName = 'VIDEO_$timestamp.mp4';
  } else {
    // Xử lý trường hợp không xác định
    throw ArgumentError('Invalid media type. Use "image" or "video".');
  }

  String mediaPath = '$mediaDirectoryPath/$mediaFileName';

  return mediaPath;
}