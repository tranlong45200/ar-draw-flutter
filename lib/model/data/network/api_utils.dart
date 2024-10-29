import 'package:dio/dio.dart';

class ApiUtils {
  static Future<Response<dynamic>?> fetchData(String url) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        // Request was successful
        return response;
      } else {
        // Handle other status codes
        return null;
      }
    } catch (error) {
      // Handle errors
      return null;
    }
  }
}
