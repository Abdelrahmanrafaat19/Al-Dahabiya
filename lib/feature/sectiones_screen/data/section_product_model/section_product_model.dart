import 'package:secondwork/feature/sectiones_screen/data/section_product_model/section_product_data.dart';

class SectionsProductModel {
  int? code;
  List<SectionProductData>? data;

  SectionsProductModel({this.code, this.data});

  SectionsProductModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <SectionProductData>[];
      json['data'].forEach((v) {
        data!.add(SectionProductData.fromJson(v));
      });
    }
  }
}
