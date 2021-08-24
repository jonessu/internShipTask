import 'dart:io';

import 'package:dio/dio.dart';

class PostImageRepository {
  static Future<Map<String, dynamic>> postImage(File? image) async {
    Dio dio = Dio();
    try {
      Response response = await dio
          .post('https://reqres.in/api/users', data: {'avatar': image!.path});
      print(response.data);
      return {'success': true, "data": response.data};
    } on DioError catch (e) {
      return {"success": false, "data": e.toString()};
    }
  }
}
