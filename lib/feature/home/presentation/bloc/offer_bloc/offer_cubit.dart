import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/home/data/offer/offer_repo/offer_repo_Imple.dart';
import 'package:secondwork/feature/home/presentation/bloc/offer_bloc/offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferRepoImple offerRepoImple;
  OfferCubit(this.offerRepoImple) : super(OfferInitState());
  Future<void> getOffers() async {
    emit(OfferIsLoadingState());
    var response = await offerRepoImple.getOffers();
    response.fold((failure) => emit(OfferFailuretState(failure.message)),
        (data) {
      if (data.data!.isEmpty) {
        emit(OfferIsEmpytState());
      } else {
        emit(OfferSuccessState(data));
      }
    });
  }
}
