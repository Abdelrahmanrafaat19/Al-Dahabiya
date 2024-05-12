class Category {
  int? id;
  Null parentId;
  String? name;
  String? image;

  Category({this.id, this.parentId, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    image = json['image'];
  }
}

class Images {
  int? id;
  String? image;

  Images({this.id, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class Attributes {
  int? id;
  String? name;
  String? value;

  Attributes({this.id, this.name, this.value});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
  }
}

class Discounts {
  int? id;
  String? discountType;
  String? discountValue;
  String? discountQuantity;

  Discounts(
      {this.id, this.discountType, this.discountValue, this.discountQuantity});

  Discounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    discountType = json['discount_type'];
    discountValue = json['discount_value'];
    discountQuantity = json['discount_quantity'];
  }
}
