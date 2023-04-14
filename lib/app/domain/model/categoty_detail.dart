import 'package:vemare/app/domain/model/brand.dart';

class CategoryDetail {
  CategoryDetail({
    this.id,
    this.name,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.image,
    this.subcategories,
    this.brands,
  });

  int? id;
  String? name;
  String? slug;
  String? tags;
  String? subtitle;
  String? description;
  String? image;
  List<CategoryDetail>? subcategories;
  List<Brand>? brands;

  factory CategoryDetail.fromJson(dynamic json) => CategoryDetail(
        id: json["id"] as int?,
        name: json["name"] as String?,
        slug: json["slug"] as String?,
        tags: json["tags"] as String?,
        subtitle: json["subtitle"] as String?,
        description: json["description"] as String?,
        image: json["image"] as String?,
        subcategories: json["subcategories"] == null
            ? []
            : (json["subcategories"] as List)
                .map(CategoryDetail.fromJson)
                .toList(),
        brands: json["brands"] == null
            ? []
            : (json["brands"] as List).map(Brand.froJson).toList(),
      );
//(res as List).map(Brand.froJson).toList();
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "tags": tags,
        "subtitle": subtitle,
        "description": description,
        "image": image,
        "subcategories": subcategories == null
            ? []
            : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
        "brands": brands == null
            ? []
            : List<dynamic>.from(brands!.map((x) => x.toJson())),
      };
}
