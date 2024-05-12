import 'package:secondwork/feature/home/data/filre_offers.dart/model/filter_order_product.dart';

abstract class OfferProductsState {}

class OfferProductsInitState extends OfferProductsState {}

class OfferProductsIsLoadingState extends OfferProductsState {}

class OfferProductsSuccessState extends OfferProductsState {
  OfferFilterProductModel offerFilterProductModel;
  OfferProductsSuccessState(this.offerFilterProductModel);
}

class OfferProductsIsEmityState extends OfferProductsState {}

class OfferProductsFailureState extends OfferProductsState {
  dynamic message;
  OfferProductsFailureState(this.message);
}
