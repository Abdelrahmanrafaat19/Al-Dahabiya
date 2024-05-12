import 'package:secondwork/feature/profile/date/gat_user_data/get_user_model/user_profile_model.dart';

abstract class UserProfileState {}

class UserProfileInitState extends UserProfileState {}

class UserProfileIsLoadingState extends UserProfileState {}

class UserProfileSuccessState extends UserProfileState {
  UserProfileModel data;
  UserProfileSuccessState(this.data);
}

class UserProfileFailureState extends UserProfileState {
  dynamic message;
  UserProfileFailureState(this.message);
}
