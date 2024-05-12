import 'package:secondwork/feature/single_product/data/single_product_model/single_product_data.dart';

class SingleProductModel {
  int? code;
  SingleProductData? data;

  SingleProductModel({this.code, this.data});

  SingleProductModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data =
        json['data'] != null ? SingleProductData.fromJson(json['data']) : null;
  }
}
