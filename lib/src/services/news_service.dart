import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_fernando/src/models/category_models.dart';
import 'package:news_app_fernando/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'https://newsapi.org/v2';
const _API_KEY = '6e761ae8c0534309abf2a1a4a6d0c394';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.memory, 'science'),
    Category(FontAwesomeIcons.satellite, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadLines();
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriaSeleccionada =>
      categoryArticles[_selectedCategory];

  getTopHeadLines() async {
    print('Cargando Headlines');
    const url = '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=us';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponsFromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    print('Cargando Categoria');
    print('categoria: $category');

    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }

    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=us&category=$category';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = newsResponsFromJson(resp.body);

    categoryArticles[category]!.addAll(newsResponse.articles);

    notifyListeners();
  }
}
