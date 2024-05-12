import 'package:secondwork/feature/home/data/offer/offer_model/offer_model.dart';

abstract class OfferState {}

class OfferInitState extends OfferState {}

class OfferIsLoadingState extends OfferState {}

class OfferSuccessState extends OfferState {
  OfferModel offerModel;
  OfferSuccessState(this.offerModel);
}

class OfferIsEmpytState extends OfferState {}

class OfferFailuretState extends OfferState {
  dynamic message;
  OfferFailuretState(this.message);
}
