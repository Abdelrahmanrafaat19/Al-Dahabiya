import 'package:secondwork/feature/home/data/brand/brand_model/brand_data.dart';

class BrandModel {
  int? code;
  List<BrandData>? data;

  BrandModel({this.code, this.data});

  BrandModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <BrandData>[];
      json['data'].forEach((v) {
        data!.add(BrandData.fromJson(v));
      });
    }
  }
}
