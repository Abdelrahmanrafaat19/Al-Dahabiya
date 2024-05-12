import 'package:secondwork/feature/sign_up.dart/data/get_government/model/government_data.dart';

class GovernmentModel {
  int? code;
  List<DataGovernment>? data;

  GovernmentModel({this.code, this.data});

  GovernmentModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <DataGovernment>[];
      json['data'].forEach((v) {
        data!.add(DataGovernment.fromJson(v));
      });
    }
  }
}
