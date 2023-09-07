class ShoppingCardProduct {
  int? id;
  String? image;
  String? productName;
  bool renting;
  int? priceOld;
  int? priceSale;
  int? quantity;
  int? total;

  ShoppingCardProduct({
    this.id,
    this.image,
    this.productName,
    required this.renting,
    this.priceOld,
    this.priceSale,
    this.quantity,
    this.total,
  });

  factory ShoppingCardProduct.fromJson(dynamic json) => ShoppingCardProduct(
        id: json["id"] as int?,
        image: json["image"] as String?,
        productName: json["product_name"] as String?,
        renting: json["renting"] as bool,
        priceOld: json["price_old"] as int?,
        priceSale: json["price_sale"] as int?,
        quantity: json["quantity"] as int?,
        total: json["total"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "product_name": productName,
        "renting": renting,
        "price_old": priceOld,
        "price_sale": priceSale,
        "quantity": quantity,
        "total": total,
      };
}


/*class ShoppingCardProduct {
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
}*/
