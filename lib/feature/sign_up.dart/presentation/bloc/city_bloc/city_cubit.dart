import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_city/city_repo/city_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/city_bloc/city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityRepoImple cityRepoImple;
  CityCubit(this.cityRepoImple) : super(CityInitState());
  Future<void> getCities(int governmentCode) async {
    emit(CityIsLoadingState());
    var response = await cityRepoImple.getCities(governmentCode);
    response.fold(
      (failure) => emit(
        CityFailureState(
          failure,
        ),
      ),
      (data) => emit(
        CitySuccessState(
          data,
        ),
      ),
    );
  }
}
