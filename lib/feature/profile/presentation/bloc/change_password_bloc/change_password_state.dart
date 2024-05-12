abstract class ChangePasswordState {}

class ChangePasswordInitState extends ChangePasswordState {}

class ChangePasswordIsLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {
  Map<String, dynamic> data;
  ChangePasswordSuccessState(this.data);
}

class ChangePasswordFailureState extends ChangePasswordState {
  dynamic message;
  ChangePasswordFailureState(this.message);
}
