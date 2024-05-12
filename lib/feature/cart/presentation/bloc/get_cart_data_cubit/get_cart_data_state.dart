part of 'get_cart_data_cubit.dart';

sealed class GetCartDataState {}

final class GetCartDataInitial extends GetCartDataState {}

final class GetCartDataIsLoading extends GetCartDataState {}

final class GetCartDataSuccess extends GetCartDataState {}

final class GetCartDataFailure extends GetCartDataState {
  final String message;
  GetCartDataFailure(this.message);
}
