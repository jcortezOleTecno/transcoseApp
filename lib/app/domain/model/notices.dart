class News {
  final int? id;
  final String? title;
  final String? slug;
  final String? tags;
  final String? subtitle;
  final String? description;
  final String? image;
  final String? imagePrivate;

  News({
    this.id,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.title,
    this.image,
    this.imagePrivate,
  });
  factory News.froJson(dynamic map) {
    return News(
      id: map['id'] as int?,
      slug: map['slug'] as String?,
      tags: map['tags'] as String?,
      subtitle: map['subtitle'] as String?,
      description: map['description'] as String?,
      title: map['title'] as String?,
      image: map['image'] as String?,
      imagePrivate: map['image_private'] as String?,
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
    };
  }
}
