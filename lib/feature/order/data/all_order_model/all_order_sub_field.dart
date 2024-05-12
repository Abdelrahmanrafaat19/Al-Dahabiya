class AllStatus {
  String? title;
  String? date;

  AllStatus({this.title, this.date});

  AllStatus.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
  }
}

class Products {
  int? id;
  int? quantity;
  double? price;
  dynamic combinations;
  String? name;
  dynamic quality;
  String? image;
  dynamic merchantId;
  String? merchantName;

  Products(
      {this.id,
      this.quantity,
      this.price,
      this.combinations,
      this.name,
      this.quality,
      this.image,
      this.merchantId,
      this.merchantName});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    combinations = json['combinations'];
    name = json['name'];
    quality = json['quality'];
    image = json['image'];
    merchantId = json['merchant_id'];
    merchantName = json['merchant_name'];
  }
}
