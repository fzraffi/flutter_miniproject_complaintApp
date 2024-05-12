import 'package:flutter/material.dart';
import 'package:k_app/models/news_model.dart';
import 'package:k_app/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  final NewsService _newsService = NewsService();

  List<NewsModel>? _news; // Ubah tipe data menjadi List<NewsModel>
  bool _isLoaded = false;

  List<NewsModel>? get news => _news;
  bool get isLoaded => _isLoaded;

  void getNews() async {
  try {
    _isLoaded = true;
    final response = await _newsService.getNews();
    if (response.statusCode == 200) {
      _news = (response.data as List<dynamic>)
          .map((e) => NewsModel.fromJson(e))
          .toList();
      notifyListeners();
    }
  } catch (e) {
    debugPrint('Error $e');
  } finally {
    _isLoaded = false;
  }
}

}
