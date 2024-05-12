import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/home/data/brand/brand_repo/brand_repo_imple.dart';
import 'package:secondwork/feature/home/presentation/bloc/brandes_bloc/brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
  BrandRepoImple brandRepoImple;
  BrandCubit(this.brandRepoImple) : super(BrandInitState());
  Future<void> getBarnd() async {
    emit(BrandIsLoadingState());
    var response = await brandRepoImple.gatBrand();
    response.fold(
      (failer) => emit(BrandFailureState(failer.message)),
      (data) => emit(
        BrandSuccesstState(data),
      ),
    );
  }
}
