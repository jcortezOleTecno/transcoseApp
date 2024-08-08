class Library {
  Library({
    required this.id,
    this.title,
    this.description,
    this.slug,
    this.subtitle,
    this.tags,
    this.visits,
    this.image,
    this.imagePrivate,
    this.videos = const [],
  });

  int id;
  String? title;
  String? description;
  String? slug;
  String? subtitle;
  String? tags;
  int? visits;
  String? image;
  String? imagePrivate;
  List<LibraryVideos> videos;

  factory Library.fromJson(dynamic json) => Library(
        id: json["id"] as int,
        title: json["title"] as String?,
        description: json["description"] as String?,
        slug: json["slug"] as String?,
        subtitle: json["subtitle"] as String?,
        tags: json["tags"] as String?,
        visits: json["visits"] as int?,
        image: json["image"] as String?,
        imagePrivate: json["image_private"] as String?,
        videos: json['videos'] == null ? [] :
        (json['videos'] as List).map((e) => LibraryVideos.fromJson(e)).toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "slug": slug,
        "subtitle": subtitle,
        "tags": tags,
        "visits": visits,
        "image_private": imagePrivate,
        "videos": videos,
      };
}

class LibraryVideos {
  final int? id;
  final String? link;
  final String? name;
  final String? description;

  LibraryVideos({
    this.id,
    this.link,
    this.name,
    this.description,
  });
  factory LibraryVideos.fromJson(dynamic map) {
    return LibraryVideos(
      id: map['id'] as int?,
      link: map['link'] as String?,
      name: map['name'] as String?,
      description: map['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'link': link,
      'name': name,
      'description': description,
    };
  }
}