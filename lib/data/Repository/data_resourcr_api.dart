import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:intershiptasks/data/models/data_models.dart';

import 'package:http/http.dart' as http;

class PostRepository {
  static Future<List> fetchPosts() async {
    List posts = [];

    var response =
        await Dio().get('https://jsonplaceholder.typicode.com/albums');
    if (response.statusCode == 200) {
      //var data = json.decode(response.data);
      //data.map((post) => posts.add(Welcome.fromJson(post))).toList();
      posts = response.data;
    }
    return posts;
  }
}
