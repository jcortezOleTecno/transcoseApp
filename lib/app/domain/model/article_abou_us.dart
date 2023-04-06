class ArticleAboutUs {
  ArticleAboutUs({
    this.id,
    this.title,
    this.slug,
    this.tags,
    this.description,
    this.image,
  });

  int? id;
  String? title;
  String? slug;
  String? tags;
  String? description;
  String? image;

  ArticleAboutUs copyWith({
    int? id,
    String? title,
    String? slug,
    String? tags,
    String? description,
    String? image,
  }) =>
      ArticleAboutUs(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        tags: tags ?? this.tags,
        description: description ?? this.description,
        image: image ?? this.image,
      );

  factory ArticleAboutUs.fromJson(dynamic json) => ArticleAboutUs(
        id: json["id"] as int?,
        title: json["title"] as String?,
        slug: json["slug"] as String?,
        tags: json["tags"] as String?,
        description: json["description"] as String?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "tags": tags,
        "description": description,
        "image": image,
      };
}
