class Library {
  Library({
    required this.id,
    this.title,
    this.slug,
    this.subtitle,
    this.tags,
    this.visits,
    this.image,
  });

  int id;
  String? title;
  String? slug;
  String? subtitle;
  String? tags;
  int? visits;
  String? image;

  factory Library.fromJson(dynamic json) => Library(
        id: json["id"] as int,
        title: json["title"] as String?,
        slug: json["slug"] as String?,
        subtitle: json["subtitle"] as String?,
        tags: json["tags"] as String?,
        visits: json["visits"] as int?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "subtitle": subtitle,
        "tags": tags,
        "visits": visits,
        "image": image,
      };
}
