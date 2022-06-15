// To parse this JSON data, do
//
//     final newsRespons = newsResponsFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

NewsRespons newsResponsFromJson(String str) =>
    NewsRespons.fromJson(json.decode(str));

String newsResponsToJson(NewsRespons data) => json.encode(data.toJson());

class NewsRespons {
  NewsRespons({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory NewsRespons.fromJson(Map<String, dynamic> json) => NewsRespons(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "NaN",
        title: json["title"],
        description: json["description"] ?? 'NaN',
        url: json["url"],
        urlToImage: json["urlToImage"] ??
            'https://media.istockphoto.com/photos/breaking-news-world-news-with-map-backgorund-picture-id1182477852?k=20&m=1182477852&s=612x612&w=0&h=I3wdSzT_5h1y9dHq_YpZ9AqdIKg8epthr8Guva8FkPA=',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? "NaN",
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? "NaN",
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
