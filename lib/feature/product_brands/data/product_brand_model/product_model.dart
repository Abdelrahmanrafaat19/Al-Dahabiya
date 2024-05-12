import 'package:secondwork/feature/product_brands/data/product_brand_model/product_data.dart';

class ProductBrandsModel {
  int? code;
  List<ProductBrandData>? data;

  ProductBrandsModel({this.code, this.data});

  ProductBrandsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <ProductBrandData>[];
      json['data'].forEach((v) {
        data!.add(ProductBrandData.fromJson(v));
      });
    }
  }
}
