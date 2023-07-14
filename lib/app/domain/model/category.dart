import 'package:vemare/app/domain/model/type_of_vehicle.dart';

class Category {
  final int? id;
  final String? name;
  final String? slug;
  final List<TypeOfVehicle>? typeVehicle;
  final String? tags;
  final String? subtitle;
  final String? description;
  final String? pvpOriginal;
  final String? pvpLowered;
  final String? image;

  Category({
    this.id,
    this.name,
    this.slug,
    this.typeVehicle,
    this.tags,
    this.subtitle,
    this.description,
    this.pvpOriginal,
    this.pvpLowered,
    this.image,
  });

  factory Category.fromJson(dynamic map) {
    return Category(
      id: map['id'] as int?,
      name: map['name'] as String?,
      slug: map['slug'] as String?,
      typeVehicle: map["vehicle_types"] == null
          ? []
          : List<TypeOfVehicle>.from(
              map["vehicle_types"]!.map((x) => TypeOfVehicle.fromJson(x))),
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
      'name': name,
      'slug': slug,
      "vehicle_types": typeVehicle == null
          ? []
          : List<dynamic>.from(typeVehicle!.map((x) => x.toJson())),
      'tags': tags,
      'subtitle': subtitle,
      'description': description,
      'pvp_original': pvpOriginal,
      'pvp_lowered': pvpLowered,
      'image': image,
    };
  }
}
