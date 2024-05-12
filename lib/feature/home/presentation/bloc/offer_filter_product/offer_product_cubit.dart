import 'package:bloc/bloc.dart';
import 'package:secondwork/feature/home/data/filre_offers.dart/filter_offers_repo.dart/offer_filter_product_repo_imple.dart';
import 'package:secondwork/feature/home/presentation/bloc/offer_filter_product/offer_product_state.dart';

class OfferProductCubit extends Cubit<OfferProductsState> {
  OfferFilterRepoImple offerFilterRepoImple;
  OfferProductCubit(this.offerFilterRepoImple)
      : super(OfferProductsInitState());
  Future<void> getProductOffer(int brandID) async {
    var response = await offerFilterRepoImple.getProductOffer(brandID);
    response.fold(
      (failure) => emit(OfferProductsFailureState(failure.message)),
      (data) {
        if (data.data!.isEmpty) {
          emit(OfferProductsIsEmityState());
        } else {
          emit(
            OfferProductsSuccessState(data),
          );
        }
      },
    );
  }
}
