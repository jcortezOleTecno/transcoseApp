class News {
  final int? id;
  final String? title;
  final String? slug;
  final String? tags;
  final String? subtitle;
  final String? description;
  final String? image;
  final String? imagePrivate;
  List<NewsVideos> videos;

  News({
    this.id,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.title,
    this.image,
    this.imagePrivate,
    this.videos = const [],
  });
  factory News.fromJson(dynamic map) {
    return News(
      id: map['id'] as int?,
      slug: map['slug'] as String?,
      tags: map['tags'] as String?,
      subtitle: map['subtitle'] as String?,
      description: map['description'] as String?,
      title: map['title'] as String?,
      image: map['image'] as String?,
      imagePrivate: map['image_private'] as String?,
      videos: map['videos'] == null ? [] :
      (map['videos'] as List).map((e) => NewsVideos.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'tags': tags,
      'subtitle': subtitle,
      'description': description,
      'title': title,
      'image': image,
      'image_private': imagePrivate,
      'videos': videos,
    };
  }
}

class NewsVideos {
  final int? id;
  final String? link;
  final String? name;
  final String? description;

  NewsVideos({
    this.id,
    this.link,
    this.name,
    this.description,
  });
  factory NewsVideos.fromJson(dynamic map) {
    return NewsVideos(
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