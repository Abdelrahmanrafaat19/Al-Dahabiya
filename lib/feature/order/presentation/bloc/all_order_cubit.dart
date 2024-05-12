import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/order/data/all_order_repo/all_order_repo_imple.dart';
import 'package:secondwork/feature/order/presentation/bloc/all_order_state.dart';

class AllOrderCubit extends Cubit<AllOrderState> {
  final AllOrderRepoImple _allOrderRepoImple;
  AllOrderCubit(this._allOrderRepoImple) : super(AllOrderInitState());
  Future<void> getAllOrder() async {
    emit(AllOrderIsLoadingState());
    var response = await _allOrderRepoImple.getAllOrderDate();
    response.fold((failure) => emit(AllOrderFailureState(failure.message)),
        (data) {
      if (data.data!.isNotEmpty) {
        emit(
          AllOrderSuccessState(data),
        );
      } else {
        emit(AllOrderIsEmptyState());
      }
    });
  }
}
