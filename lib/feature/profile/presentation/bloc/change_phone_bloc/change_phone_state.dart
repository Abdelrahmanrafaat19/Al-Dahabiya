abstract class ChangePhoneState {}

class ChangePhoneInitState extends ChangePhoneState {}

class ChangePhoneIsLoadingState extends ChangePhoneState {}

class ChangePhoneSuccessState extends ChangePhoneState {
  Map<String, dynamic> data;
  ChangePhoneSuccessState(this.data);
}

class ChangePhoneFailureState extends ChangePhoneState {
  dynamic message;
  ChangePhoneFailureState(this.message);
}
