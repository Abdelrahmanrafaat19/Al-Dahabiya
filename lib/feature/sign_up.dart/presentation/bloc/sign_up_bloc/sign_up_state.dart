abstract class SignUpState {}

class SignUpInitState extends SignUpState {}

class SignUpIsLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  Map<String, dynamic> data;
  SignUpSuccessState(this.data);
}

class SignUpFailureState extends SignUpState {
  dynamic message;
  SignUpFailureState(this.message);
}
