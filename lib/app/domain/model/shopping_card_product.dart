class ShoppingCardProduct {
  ShoppingCardProduct({
    this.id,
    this.userId,
    this.renting,
    this.promotionName,
    this.promotionPrice,
    this.image,
  });

  int? id;
  int? userId;
  int? renting;
  String? promotionName;
  String? promotionPrice;
  String? image;

  ShoppingCardProduct copyWith({
    int? id,
    int? userId,
    int? renting,
    String? promotionName,
    String? promotionPrice,
    String? image,
  }) =>
      ShoppingCardProduct(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        renting: renting ?? this.renting,
        promotionName: promotionName ?? this.promotionName,
        promotionPrice: promotionPrice ?? this.promotionPrice,
        image: image ?? this.image,
      );

  factory ShoppingCardProduct.fromJson(dynamic json) => ShoppingCardProduct(
        id: json["id"] as int?,
        userId: json["user_id"] as int?,
        renting: json["renting"] as int?,
        promotionName: json["promotion_name"] as String?,
        promotionPrice: json["promotion_price"] as String?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "renting": renting,
        "promotion_name": promotionName,
        "promotion_price": promotionPrice,
        "image": image,
      };
}
