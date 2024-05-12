import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:secondwork/feature/shoping/data/shoping_repo/shoping_repo_imple.dart';

part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  ShoppingRepoImple _shoppingRepoImple;
  ShoppingCubit(this._shoppingRepoImple) : super(ShoppingInitial());
  Future<void> shoppingMethod(Map<String, dynamic> data) async {
    emit(ShoppingIsLoading());
    var response = await _shoppingRepoImple.shoppingMethod(data);
    response.fold((failure) => emit(ShoppingFailure(failure.message)), (data) {
      emit(
        ShoppingSuccess(data),
      );
      print("this is Shopping Data $data");
    });
  }
}
