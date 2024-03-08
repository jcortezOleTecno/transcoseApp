class Brand {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final String link;

  Brand({
    this.id,
    this.name,
    this.description,
    this.image,
    this.link = '',
  });
  factory Brand.froJson(dynamic map) {
    return Brand(
      id: map['id'] as int?,
      name: map['name'] as String?,
      description: map['description'] as String?,
      image: map['image'] as String?,
      link: map['link'] == null ? '' : map['link'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'link': link,
    };
  }

  @override
  bool operator ==(other) {
    return (other is Brand) &&
        other.id == id &&
        other.description == description &&
        other.name == name &&
        other.image == image &&
        other.link == link;
  }

  @override
  int get hashCode =>
      id.hashCode ^ description.hashCode ^ name.hashCode ^ image.hashCode ^ link.hashCode;
}
