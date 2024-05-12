import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/single_product/data/single_product_repo/single_product_repo_imple.dart';
import 'package:secondwork/feature/single_product/presentation/bloc/single_product_state.dart';

class SingleProductCubit extends Cubit<SingleProductState> {
  final SingleProductRepoImple singleProductRepoImple;
  SingleProductCubit(this.singleProductRepoImple)
      : super(SingleProductInitState());
  Future<void> getSingleProduct(int productId) async {
    emit(SingleProductIsLoadingState());
    var response = await singleProductRepoImple.getProductData(productId);
    response.fold(
      (failure) => emit(SingleProductFailureState(failure.message)),
      (data) => emit(
        SingleProductSuccessState(data),
      ),
    );
  }
}
