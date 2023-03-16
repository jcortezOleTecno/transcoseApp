class Product {
  final int? id;
  final String? name;
  final String? slug;
  final String? tags;
  final String? subtitle;
  final String? description;
  final String? image;

  Product({
    this.id,
    this.name,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.image,
  });

  factory Product.froJson(dynamic map) {
    return Product(
      id: map['id'] as int?,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      tags: map['tags'] as String?,
      subtitle: map['subtitle'] as String?,
      description: map['description'] as String?,
      image: map['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
      'tags': tags,
      'subtitle': subtitle,
      'description': description,
      'image': image,
    };
  }
}
