import 'package:secondwork/feature/sign_up.dart/data/get_zone/zone_model/zone_date.dart';

class ZoneModel {
  int? code;
  List<ZoneData>? data;

  ZoneModel({this.code, this.data});

  ZoneModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <ZoneData>[];
      json['data'].forEach((v) {
        data!.add(ZoneData.fromJson(v));
      });
    }
  }
}
