import 'package:secondwork/feature/profile/date/get_user_address/user_address_model/user_address_data.dart';

class UserAddressModel {
  int? code;
  List<UserAddressData>? data;

  UserAddressModel({this.code, this.data});

  UserAddressModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <UserAddressData>[];
      json['data'].forEach((v) {
        data!.add(UserAddressData.fromJson(v));
      });
    }
  }
}
