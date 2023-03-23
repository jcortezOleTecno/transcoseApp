class Brand {
  final int? id;
  final String? name;
  final String? description;
  final String? image;

  Brand({
    this.id,
    this.name,
    this.description,
    this.image,
  });
  factory Brand.froJson(dynamic map) {
    return Brand(
      id: map['id'] as int?,
      name: map['name'] as String?,
      description: map['description'] as String?,
      image: map['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
