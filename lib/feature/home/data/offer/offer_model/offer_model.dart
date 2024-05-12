import 'package:secondwork/feature/home/data/offer/offer_model/offer_data.dart';

class OfferModel {
  int? code;
  List<OfferData>? data;

  OfferModel({this.code, this.data});

  OfferModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <OfferData>[];
      json['data'].forEach((v) {
        data!.add(OfferData.fromJson(v));
      });
    }
  }
}
