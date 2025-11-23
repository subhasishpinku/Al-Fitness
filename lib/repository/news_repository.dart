import 'package:aifitness/data/network/api_service.dart';

import '../models/news_model.dart';

class NewsRepository {
  final ApiService _apiService = ApiService();

  Future<List<NewsItem>> fetchNews(
    int userId,
    int categoryId,
    String? deviceId,
  ) async {
    try {
      // Use the reusable postRequest()
      final response = await _apiService.postRequest(
        "get-news-list-community-ai?page=1",
        {"user_id": userId, "category_id": categoryId, "device_id": deviceId},
      );

      final jsonData = response.data;

      // Extract inside: data → data → []
      List items = jsonData["data"]["data"];

      return items.map((item) => NewsItem.fromJson(item)).toList();
    } catch (e) {
      throw Exception("News Fetch Error: $e");
    }
  }
}
