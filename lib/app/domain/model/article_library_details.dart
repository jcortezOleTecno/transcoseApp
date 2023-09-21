import 'library.dart';

class ArticleLibraryDetails {
  Library? data;
  List<Library>? related;

  ArticleLibraryDetails({
    this.data,
    this.related,
  });

  factory ArticleLibraryDetails.fromJson(dynamic json) => ArticleLibraryDetails(
        data: json["data"] == null ? null : Library.fromJson(json["data"]),
        related: json["related"] == null
            ? []
            : List<Library>.from(
                json["related"]!.map((x) => Library.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "related": related == null
            ? []
            : List<dynamic>.from(related!.map((x) => x.toJson())),
      };
}
