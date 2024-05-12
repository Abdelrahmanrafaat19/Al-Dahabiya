abstract class AddAddressState {}

class AddAddressInitState extends AddAddressState {}

class AddAddressIsLoadingState extends AddAddressState {}

class AddAddressSuccessState extends AddAddressState {
  Map<String, dynamic> data;
  AddAddressSuccessState(this.data);
}

class AddAddressFailureState extends AddAddressState {
  dynamic message;
  AddAddressFailureState(this.message);
}
