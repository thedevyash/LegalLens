import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:sih_24/models/news.dart';
import 'package:sih_24/utils/urls.dart';

class GetnewsArticlesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<news> newsArticles = <news>[].obs;

  Future<bool> getNewsArticles() async {
    isLoading.value = true;
    update();

    var uri = Uri.parse("${url.getNews}");
    try {
      final response = await http.get(
        uri,
        headers: {"Content-Type": "application/json"},
      );
      print(uri);
      print("getNews called");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        newsArticles.value =
            (data['news'] as List).map((i) => news.fromJson(i)).toList();
        return true;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
      update();
    }
    return false;
  }
}
