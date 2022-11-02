// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.status,
    this.totalResults,
    this.results,
    this.nextPage,
  });

  String? status;
  int? totalResults;
  List<Result>? results;
  int? nextPage;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result {
  Result({
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.country,
    this.category,
    this.language,
  });

  String? title;
  String? link;
  List<String>? keywords;
  dynamic? creator;
  dynamic? videoUrl;
  String? description;
  String? content;
  DateTime? pubDate;
  dynamic? imageUrl;
  String? sourceId;
  List<Country>? country;
  List<Category>? category;
  Language? language;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? null
            : List<String>.from(json["keywords"].map((x) => x)),
        creator: json["creator"],
        videoUrl: json["video_url"],
        description: json["description"] == null ? null : json["description"],
        content: json["content"] == null ? null : json["content"],
        pubDate: DateTime.parse(json["pubDate"]),
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
        country: List<Country>.from(
            json["country"].map((x) => countryValues.map[x])),
        category: List<Category>.from(
            json["category"].map((x) => categoryValues.map[x])),
        language: languageValues.map[json["language"]],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "keywords": keywords == null
            ? null
            : List<dynamic>.from(keywords!.map((x) => x)),
        "creator": creator,
        "video_url": videoUrl,
        "description": description == null ? null : description,
        "content": content == null ? null : content,
        "pubDate": pubDate!.toIso8601String(),
        "image_url": imageUrl,
        "source_id": sourceId,
        "country":
            List<dynamic>.from(country!.map((x) => countryValues.reverse[x])),
        "category":
            List<dynamic>.from(category!.map((x) => categoryValues.reverse[x])),
        "language": languageValues.reverse[language],
      };
}

enum Category { TOP, BUSINESS }

final categoryValues =
    EnumValues({"business": Category.BUSINESS, "top": Category.TOP});

enum Country { VIETNAM }

final countryValues = EnumValues({"Vietnam": Country.VIETNAM});

enum Language { VIETNAMESE }

final languageValues = EnumValues({"Vietnamese": Language.VIETNAMESE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
