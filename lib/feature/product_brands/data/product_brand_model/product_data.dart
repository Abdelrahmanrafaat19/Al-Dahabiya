class ProductBrandData {
  int? id;
  String? name;
  String? image;
  String? type;
  int? quantity;
  double? price;
  String? currency;
  bool? hasDiscount;
  double? discountPrice;
  int? review;

  ProductBrandData(
      {this.id,
      this.name,
      this.image,
      this.type,
      this.quantity,
      this.price,
      this.currency,
      this.hasDiscount,
      this.discountPrice,
      this.review});

  ProductBrandData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    type = json['type'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
    hasDiscount = json['has_discount'];
    discountPrice = json['discount_price'];
    review = json['review'];
  }
}
