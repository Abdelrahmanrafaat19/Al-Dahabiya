import 'package:secondwork/feature/home/data/filre_offers.dart/model/sub_fieldes_model.dart';

class OfferFilterData {
  int? id;
  String? type;
  int? status;
  Null isFavourite;
  String? name;
  String? desc;
  String? productPhoto;
  double? price;
  String? currency;
  bool? hasDiscount;
  double? discountPrice;
  int? review;
  int? productQuantity;
  Null quality;
  Category? category;
  Null option;
  List<Images>? images;
  List<Attributes>? attributes;
  List<Discounts>? discounts;
  List<dynamic>? reviews;

  OfferFilterData(
      {this.id,
      this.type,
      this.status,
      this.isFavourite,
      this.name,
      this.desc,
      this.productPhoto,
      this.price,
      this.currency,
      this.hasDiscount,
      this.discountPrice,
      this.review,
      this.productQuantity,
      this.quality,
      this.category,
      this.option,
      this.images,
      this.attributes,
      this.discounts,
      this.reviews});

  OfferFilterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    isFavourite = json['is_favourite'];
    name = json['name'];
    desc = json['desc'];
    productPhoto = json['product_photo'];
    price = json['price'];
    currency = json['currency'];
    hasDiscount = json['has_discount'];
    discountPrice = json['discount_price'];
    review = json['review'];
    productQuantity = json['product_quantity'];
    quality = json['quality'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    option = json['option'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(Discounts.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <dynamic>[];
      json['reviews'].forEach((v) {
        reviews!.add(v);
      });
    }
  }
}
