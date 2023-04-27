import 'package:vemare/app/domain/model/brand.dart';

class CategoryDetail {
  DetailCat? category;
  List<Brand>? brands;
  List<Subcategory>? subcategories;

  CategoryDetail({
    this.category,
    this.brands,
    this.subcategories,
  });

  factory CategoryDetail.fromJson(dynamic json) => CategoryDetail(
        category: json["category"] == null
            ? null
            : DetailCat.fromJson(json["category"]),
        brands: json["brands"] == null
            ? []
            : List<Brand>.from(json["brands"]!.map((x) => Brand.froJson(x))),
        subcategories: json["subcategories"] == null
            ? []
            : List<Subcategory>.from(
                json["subcategories"]!.map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category?.toJson(),
        "brands": brands == null
            ? []
            : List<dynamic>.from(brands!.map((x) => x.toJson())),
        "subcategories": subcategories == null
            ? []
            : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
      };
}

// class Brand {
//     int? id;
//     String? name;
//     dynamic description;
//     int? homeAppearance;
//     String? image;

//     Brand({
//         this.id,
//         this.name,
//         this.description,
//         this.homeAppearance,
//         this.image,
//     });

//     factory Brand.fromJson(Map<String, dynamic> json) => Brand(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         homeAppearance: json["home_appearance"],
//         image: json["image"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "home_appearance": homeAppearance,
//         "image": image,
//     };
// }

class DetailCat {
  int? id;
  String? name;
  String? slug;
  String? tags;
  String? subtitle;
  String? description;
  int? homeAppearance;
  String? image;

  DetailCat({
    this.id,
    this.name,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.homeAppearance,
    this.image,
  });

  factory DetailCat.fromJson(Map<String, dynamic> json) => DetailCat(
        id: json["id"] == '' ? 0 : json["id"],
        name: json["name"],
        slug: json["slug"],
        tags: json["tags"],
        subtitle: json["subtitle"],
        description: json["description"],
        homeAppearance:
            json["home_appearance"] == '' ? 0 : json["home_appearance"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "tags": tags,
        "subtitle": subtitle,
        "description": description,
        "home_appearance": homeAppearance,
        "image": image,
      };
}

class Subcategory {
  int? id;
  String? name;
  String? slug;
  String? tags;
  String? subtitle;
  String? description;
  String? image;
  String? categoryName;
  List<Brand>? brands;

  Subcategory({
    this.id,
    this.name,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.image,
    this.categoryName,
    this.brands,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        tags: json["tags"],
        subtitle: json["subtitle"],
        description: json["description"],
        image: json["image"],
        categoryName: json["categoryName"],
        brands: json["brands"] == null
            ? []
            : List<Brand>.from(json["brands"]!.map((x) => Brand.froJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "tags": tags,
        "subtitle": subtitle,
        "description": description,
        "image": image,
        "categoryName": categoryName,
        "brands": brands == null
            ? []
            : List<dynamic>.from(brands!.map((x) => x.toJson())),
      };
}

/*
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
}*/
