import 'package:secondwork/feature/home/data/section/section_model/section_data.dart';

class SectionModel {
  int? code;
  List<SectionData>? data;

  SectionModel({this.code, this.data});

  SectionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <SectionData>[];
      json['data'].forEach((v) {
        data!.add(SectionData.fromJson(v));
      });
    }
  }
}
