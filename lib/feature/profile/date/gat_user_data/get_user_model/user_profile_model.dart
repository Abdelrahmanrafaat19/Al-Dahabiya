import 'package:secondwork/feature/profile/date/gat_user_data/get_user_model/user_profile_data.dart';

class UserProfileModel {
  int? code;
  UserProfileData? data;

  UserProfileModel({this.code, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? UserProfileData.fromJson(json['data']) : null;
  }
}
