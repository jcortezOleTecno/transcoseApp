class Notices {
  final int? id;
  final String? title;
  final String? slug;
  final String? tags;
  final String? subtitle;
  final String? description;
  final String? image;

  Notices({
    this.id,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.title,
    this.image,
  });
  factory Notices.froJson(dynamic map) {
    return Notices(
      id: map['id'] as int?,
      slug: map['slug'] as String?,
      tags: map['tags'] as String?,
      subtitle: map['subtitle'] as String?,
      description: map['description'] as String?,
      title: map['title'] as String?,
      image: map['image'] as String?,
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
    };
  }
}
