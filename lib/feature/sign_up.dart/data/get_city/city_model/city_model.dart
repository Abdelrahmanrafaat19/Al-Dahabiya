import 'package:secondwork/feature/sign_up.dart/data/get_city/city_model/city_data.dart';

class CityModel {
  int? code;
  List<CityData>? data;

  CityModel({this.code, this.data});

  CityModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data!.add(CityData.fromJson(v));
      });
    }
  }
}
