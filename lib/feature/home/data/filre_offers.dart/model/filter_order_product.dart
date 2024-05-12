import 'package:secondwork/feature/home/data/filre_offers.dart/model/data_oreder_filter_model.dart';

class OfferFilterProductModel {
  int? code;
  List<OfferFilterData>? data;

  OfferFilterProductModel({this.code, this.data});

  OfferFilterProductModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <OfferFilterData>[];
      json['data'].forEach((v) {
        data!.add(OfferFilterData.fromJson(v));
      });
    }
  }
}
