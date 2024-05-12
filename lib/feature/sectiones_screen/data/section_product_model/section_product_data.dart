class SectionProductData {
  dynamic id;
  String? name;
  String? image;
  String? type;
  dynamic quantity;
  dynamic price;
  String? currency;
  bool? hasDiscount;
  dynamic discountPrice;
  dynamic review;

  SectionProductData(
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

  SectionProductData.fromJson(Map<String, dynamic> json) {
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
