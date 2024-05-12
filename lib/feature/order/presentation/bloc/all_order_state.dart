import 'package:secondwork/feature/order/data/all_order_model/all_order_model.dart';

abstract class AllOrderState {}

class AllOrderInitState extends AllOrderState {}

class AllOrderIsLoadingState extends AllOrderState {}

class AllOrderSuccessState extends AllOrderState {
  AllOrderModel data;
  AllOrderSuccessState(this.data);
}

class AllOrderIsEmptyState extends AllOrderState {}

class AllOrderFailureState extends AllOrderState {
  dynamic message;
  AllOrderFailureState(this.message);
}
