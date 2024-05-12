part of 'shopping_cubit.dart';

@immutable
sealed class ShoppingState {}

final class ShoppingInitial extends ShoppingState {}

final class ShoppingIsLoading extends ShoppingState {}

final class ShoppingSuccess extends ShoppingState {
  final Map<String, dynamic> data;
  ShoppingSuccess(this.data);
}

final class ShoppingFailure extends ShoppingState {
  final dynamic maessge;
  ShoppingFailure(this.maessge);
}
