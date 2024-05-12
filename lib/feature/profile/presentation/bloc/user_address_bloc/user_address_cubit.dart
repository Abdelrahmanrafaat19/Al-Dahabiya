import 'package:bloc/bloc.dart';
import 'package:secondwork/feature/profile/date/get_user_address/user_address_repo/user_address_repo.dart';
import 'package:secondwork/feature/profile/presentation/bloc/user_address_bloc/user_address_state.dart';

class UserAddressCubit extends Cubit<UserAddressState> {
  UserAddressRepoImple userAddressRepoImple;
  UserAddressCubit(this.userAddressRepoImple) : super(UserAddressInitState());
  Future<void> getUserAddressMethod() async {
    emit(UserAddressIsLoadingState());
    var response = await userAddressRepoImple.getUserAddress();
    response.fold(
      (failure) => emit(
        UserAddressFailureState(
          failure.message,
        ),
      ),
      (userAddressModel) => emit(
        UserAddressSuccessState(
          userAddressModel,
        ),
      ),
    );
  }
}
