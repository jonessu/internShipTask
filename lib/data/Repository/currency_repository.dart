import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intershiptasks/data/models/currency_api_model.dart';

class CurrencyRepository {
  static Future<List> fetchcurrencies() async {
    Map<String, dynamic> posts;

    var response = await Dio()
        .get("https://v1.nocodeapi.com/jonessu/cx/vxPqTWYFLCplfpXj/rates");

    //var data = json.decode(response.data);
    //data.map((post) => posts.add(Welcome.fromJson(post))).toList();
    posts = response.data["rates"];
    print(response.data["rates"]);

    var apiResponJson = response.data;

    var temp = (posts.keys).toList();

    return temp;
  }
}

//'http://data.fixer.io/api/latest?access_key=9e99e01c1a0d4b6206f9619b1c2d1774'
