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
  double? promotionPrice;
  double? promotionPriceLowered;
  String? image;

  factory ShoppingCardProduct.fromJson(dynamic json) => ShoppingCardProduct(
        id: json["id"] as int?,
        userId: json["user_id"] as int?,
        renting: json["renting"] as int?,
        quantity: json["quantity"] as int?,
        promotionName: json["product_name"] as String?,
        promotionPrice: json["price_old"]?.toDouble(),
        promotionPriceLowered: (json["price_sale"]?.toDouble()) == 0.0
            ? null
            : json["price_sale"]?.toDouble(),
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
