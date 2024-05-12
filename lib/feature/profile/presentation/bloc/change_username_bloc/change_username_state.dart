abstract class ChangeUserNameState {}

class ChangeUserNameInitState extends ChangeUserNameState {}

class ChangeUserNameIsLoadingState extends ChangeUserNameState {}

class ChangeUserNameSuccessState extends ChangeUserNameState {
  Map<String, dynamic> data;
  ChangeUserNameSuccessState(this.data);
}

class ChangeUserNameFailureState extends ChangeUserNameState {
  dynamic message;
  ChangeUserNameFailureState(this.message);
}
