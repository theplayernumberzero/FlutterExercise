import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_kutuphanesi_example1/models/post_model.dart';

class Service {
  final dio = Dio();
  final url = "https://jsonplaceholder.typicode.com/posts/1/comments";

  //Data çekilecek. Uzun sürebilir bundan dolayı future yapısı kullanılacak
  Future<List<PostModel>> getPosts() async {
    List<PostModel> posts = [];
    final response = await dio.get(url);

    //200
    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data as List;
      posts = responseData.map((e) => PostModel.fromJson(e)).toList();
    } else {}
    return posts;
  }
}
