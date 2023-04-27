class ShoppingCardProduct {
  ShoppingCardProduct({
    this.id,
    this.userId,
    this.renting,
    this.quantity,
    this.promotionName,
    this.promotionPrice,
    this.promotionPriceLowered,
    this.image,
  });

  int? id;
  int? userId;
  int? renting;
  int? quantity;
  String? promotionName;
  String? promotionPrice;
  String? promotionPriceLowered;
  String? image;

  ShoppingCardProduct copyWith({
    int? id,
    int? userId,
    int? renting,
    int? quantity,
    String? promotionName,
    String? promotionPrice,
    String? promotionPriceLowered,
    String? image,
  }) =>
      ShoppingCardProduct(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        renting: renting ?? this.renting,
        quantity: quantity ?? this.quantity,
        promotionName: promotionName ?? this.promotionName,
        promotionPrice: promotionPrice ?? this.promotionPrice,
        promotionPriceLowered:
            promotionPriceLowered ?? this.promotionPriceLowered,
        image: image ?? this.image,
      );

  factory ShoppingCardProduct.fromJson(dynamic json) => ShoppingCardProduct(
        id: json["id"] as int?,
        userId: json["user_id"] as int?,
        renting: json["renting"] as int?,
        quantity: json["quantity"] as int?,
        promotionName: json["promotion_name"] as String?,
        promotionPrice: json["promotion_price"] as String?,
        promotionPriceLowered: json["promotion_price_lowered"] as String?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "renting": renting,
        "quantity": quantity,
        "promotion_name": promotionName,
        "promotion_price": promotionPrice,
        "promotion_price_lowered": promotionPriceLowered,
        "image": image,
      };
}
