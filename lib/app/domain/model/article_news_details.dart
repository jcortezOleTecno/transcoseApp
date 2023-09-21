import 'notices.dart';

class ArticleNewsDetails {
  News? data;
  List<News>? related;

  ArticleNewsDetails({
    this.data,
    this.related,
  });

  factory ArticleNewsDetails.fromJson(dynamic json) => ArticleNewsDetails(
        data: json["data"] == null ? null : News.fromJson(json["data"]),
        related: json["related"] == null
            ? []
            : List<News>.from(json["related"]!.map((x) => News.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "related": related == null
            ? []
            : List<dynamic>.from(related!.map((x) => x.toJson())),
      };
}
