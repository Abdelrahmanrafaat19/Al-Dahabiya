abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSaccussState extends LoginState {
  Map<String, dynamic> data;
  LoginSaccussState(this.data);
}

class LoginFailureState extends LoginState {
  dynamic massege;
  LoginFailureState(this.massege);
}
