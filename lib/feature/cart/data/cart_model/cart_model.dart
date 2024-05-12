import 'package:hive_flutter/hive_flutter.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartProductData extends HiveObject {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  String? type;
  @HiveField(2)
  dynamic status;
  @HiveField(3)
  bool? isFavourite;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? desc;
  @HiveField(6)
  String? productPhoto;
  @HiveField(7)
  double? price;
  @HiveField(8)
  String? currency;
  @HiveField(9)
  bool? hasDiscount;
  @HiveField(10)
  dynamic discountPrice;
  @HiveField(11)
  dynamic review;
  @HiveField(12)
  dynamic productQuantity;
  @HiveField(13)
  dynamic quality;
  @HiveField(14)
  dynamic option;

  CartProductData({
    this.id,
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
  });
}
