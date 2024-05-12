abstract class CancelOrderState {}

class CancelOrderInitState extends CancelOrderState {}

class CancelOrderIsLoadingState extends CancelOrderState {}

class CancelOrderSucceessState extends CancelOrderState {
  Map<String, dynamic> data;
  CancelOrderSucceessState(this.data);
}

class CancelOrderFailureState extends CancelOrderState {
  dynamic message;
  CancelOrderFailureState(this.message);
}
