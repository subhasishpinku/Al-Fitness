import 'package:aifitness/models/news_categories_model.dart';
import 'package:aifitness/models/news_model.dart';
import 'package:aifitness/repository/news_category_repository.dart';
import 'package:aifitness/repository/news_repository.dart';
import 'package:flutter/material.dart';

class FitNetworkViewModel extends ChangeNotifier {
  final _repo = NewsCategoryRepository();
  final repository = NewsRepository();
  int selectedCategoryId = 0;

  bool isLoading = false;
  String? error;
  List<NewsCategory> categories = [];
  List<NewsItem> newsList = [];
  String? errorMessage;
  Future<void> getCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response = await _repo.fetchCategories();
      categories = response.data;
    } catch (e) {
      error = e.toString();
      print("getCategories $e");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadNews({required int userId, required int categoryId, String? deviceId}) async {
    try {
      isLoading = true;
      notifyListeners();

      newsList = await repository.fetchNews(userId,categoryId,deviceId);
      print("newsList $newsList");
      isLoading = false;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      print("newsList $e");
      isLoading = false;
      notifyListeners();
    }
  }


void setSelectedCategory(int id) {
  selectedCategoryId = id;
  notifyListeners();
}
}
