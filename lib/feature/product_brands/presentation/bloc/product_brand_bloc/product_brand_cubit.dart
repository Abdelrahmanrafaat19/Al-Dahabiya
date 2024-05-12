import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/product_brands/data/product_brand_repo/product_brand_repo_imple.dart';
import 'package:secondwork/feature/product_brands/presentation/bloc/product_brand_bloc/product_brand_state.dart';

class ProductBrandCubit extends Cubit<ProductBrandState> {
  ProductBrandRepoImple productBrandRepoImple;
  ProductBrandCubit(this.productBrandRepoImple)
      : super(ProductBrandInitState());
  Future<void> getProductBrand(int brandID) async {
    var response = await productBrandRepoImple.getProductBrand(brandID);
    response.fold(
      (failure) => emit(ProductBrandFailuretate(failure.message)),
      (data) {
        if (data["data"].isEmpty) {
          emit(ProductBrandIsEmptyState());
        } else {
          emit(
            ProductBrandSuccessState(data),
          );
        }
      },
    );
  }
}
