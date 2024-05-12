import 'package:bloc/bloc.dart';
import 'package:secondwork/feature/order/data/cancel_order/cancel_order_repo/cancel_order_repo_imple.dart';
import 'package:secondwork/feature/order/presentation/bloc/cancel_order_bloc/cancel_order_state.dart';

class CancelOrderCubit extends Cubit<CancelOrderState> {
  final CancelOrderRepoImple _cancelOrderRepoImple;
  CancelOrderCubit(this._cancelOrderRepoImple) : super(CancelOrderInitState());
  Future<void> cancelOrderMethod(Map<String, dynamic> data) async {
    emit(CancelOrderIsLoadingState());
    var response = await _cancelOrderRepoImple.cancelOrderMethod(data);
    response.fold(
      (failure) => emit(CancelOrderFailureState(failure.message)),
      (data) => emit(
        CancelOrderSucceessState(data),
      ),
    );
  }
}
