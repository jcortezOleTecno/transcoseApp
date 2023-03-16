class Promotion {
  final int? id;
  final int? categoryId;
  final String? name;
  final String? slug;
  final String? tags;
  final String? subtitle;
  final String? description;
  final String? pvpOriginal;
  final String? pvpLowered;
  final String? image;

  Promotion({
    this.id,
    this.categoryId,
    this.name,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.pvpOriginal,
    this.pvpLowered,
    this.image,
  });

  factory Promotion.froJson(dynamic map) {
    return Promotion(
      id: map['id'] as int?,
      categoryId: map['category_id'] as int?,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      tags: map['tags'] as String?,
      subtitle: map['subtitle'] as String?,
      description: map['description'] as String?,
      pvpOriginal: map['pvp_original'] as String?,
      pvpLowered: map['pvp_lowered'] as String?,
      image: map['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'category_id': categoryId,
      'name': name,
      'slug': slug,
      'tags': tags,
      'subtitle': subtitle,
      'description': description,
      'pvp_original': pvpOriginal,
      'pvp_lowered': pvpLowered,
      'image': image,
    };
  }
}
