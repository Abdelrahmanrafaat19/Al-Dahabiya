import 'package:secondwork/feature/home/data/slider/slider_model/slider_data.dart';

class SliderModel {
  int? code;
  List<Data>? data;

  SliderModel({this.code, this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}
