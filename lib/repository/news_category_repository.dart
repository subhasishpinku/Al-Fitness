import 'dart:convert';
import 'package:aifitness/models/news_categories_model.dart';
import 'package:dio/dio.dart';

class NewsCategoryRepository {
  final _dio = Dio();

  Future<NewsCategoryResponse> fetchCategories() async {
    const url =
        "https://aipoweredfitness.com/api/get-news-categories-list?type=community&app_type=1";

    try {
      final response = await _dio.get(url);

      dynamic resData = response.data;

      // If response is JSON string → convert to Map
      if (resData is String) {
        resData = jsonDecode(resData);
      }

      // If only "data" field is string
      if (resData is Map && resData['data'] is String) {
        resData['data'] = jsonDecode(resData['data']);
      }

      return NewsCategoryResponse.fromJson(resData);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    }
  }
}
