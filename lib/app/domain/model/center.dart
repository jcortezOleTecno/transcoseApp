import 'dart:convert';

List<Center> centerFromJson(String str) =>
    List<Center>.from(json.decode(str).map((x) => Center.fromJson(x)));

String centerToJson(List<Center> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Center {
  Center({
    required this.id,
    this.name,
    this.slug,
    this.tags,
    this.email,
    this.phone,
    this.address,
    this.province,
    this.city,
    this.description,
    this.longitude,
    this.latitude,
    this.image,
  });

  int id;
  String? name;
  String? slug;
  String? tags;
  String? email;
  String? phone;
  String? address;
  String? province;
  String? city;
  String? description;
  String? longitude;
  String? latitude;
  String? image;

  Center copyWith({
    int? id,
    String? name,
    String? slug,
    String? tags,
    String? email,
    String? phone,
    String? address,
    String? province,
    String? city,
    String? description,
    String? longitude,
    String? latitude,
    String? image,
  }) =>
      Center(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        tags: tags ?? this.tags,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        province: province ?? this.province,
        city: city ?? this.city,
        description: description ?? this.description,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        image: image ?? this.image,
      );

  factory Center.fromJson(dynamic json) => Center(
        id: json["id"] as int,
        name: json["name"] as String?,
        slug: json["slug"] as String?,
        tags: json["tags"] as String?,
        email: json["email"] as String?,
        phone: json["phone"] as String?,
        address: json["address"] as String?,
        province: json["province"] as String?,
        city: json["city"] as String?,
        description: json["description"] as String?,
        longitude: json["longitude"] as String?,
        latitude: json["latitude"] as String?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "tags": tags,
        "email": email,
        "phone": phone,
        "address": address,
        "province": province,
        "city": city,
        "description": description,
        "longitude": longitude,
        "latitude": latitude,
        "image": image,
      };
}
