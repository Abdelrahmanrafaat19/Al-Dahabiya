abstract class ContactUsState {}

class ContactUsInitState extends ContactUsState {}

class ContactUsIsLoadingState extends ContactUsState {}

class ContactUsSuccessState extends ContactUsState {
  dynamic data;
  ContactUsSuccessState(this.data);
}

class ContactUsFailureState extends ContactUsState {
  dynamic message;
  ContactUsFailureState(this.message);
}
