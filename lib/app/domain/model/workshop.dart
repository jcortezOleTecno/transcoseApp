class WorkShop {
  final int? id;
  final String? name;
  final String? externalLink;
  final String? tags;
  final String? subtitle;
  final String? description;
  final String? videoLink;
  final String? image;
  final List<Gallery>? gallery;

  WorkShop({
    this.id,
    this.name,
    this.externalLink,
    this.tags,
    this.subtitle,
    this.description,
    this.videoLink,
    this.image,
    this.gallery,
  });
  factory WorkShop.froJson(dynamic map) {
    return WorkShop(
      id: map['id'] as int?,
      name: map['name'] as String?,
      tags: map['tags'] as String?,
      subtitle: map['subtitle'] as String?,
      description: map['description'] as String?,
      externalLink: map['external_link'] as String?,
      videoLink: map['video_link'] as String?,
      image: map['image'] as String?,
      gallery:
          List<Gallery>.from(map["gallery"].map((x) => Gallery.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'tags': tags,
      'subtitle': subtitle,
      'description': description,
      'external_link': externalLink,
      'video_link': videoLink,
      'image': image,
      "gallery": List<dynamic>.from(gallery!.map((x) => x.toJson())),
    };
  }
}

class Gallery {
  Gallery({
    required this.imagen,
  });

  String imagen;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
      };
}
