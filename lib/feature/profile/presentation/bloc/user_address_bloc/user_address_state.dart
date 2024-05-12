import 'package:secondwork/feature/profile/date/get_user_address/user_address_model/user_address_model.dart';

abstract class UserAddressState {}

class UserAddressInitState extends UserAddressState {}

class UserAddressIsLoadingState extends UserAddressState {}

class UserAddressSuccessState extends UserAddressState {
  UserAddressModel data;
  UserAddressSuccessState(this.data);
}

class UserAddressFailureState extends UserAddressState {
  dynamic message;
  UserAddressFailureState(this.message);
}
