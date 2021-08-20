import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:intershiptasks/data/models/data_models.dart';

import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<DataApiModel>> fetchPosts() async {
    List<DataApiModel> posts = [];

    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      data.map((post) => posts.add(DataApiModel.fromJson(post))).toList();
    }
    return posts;
  }
}
