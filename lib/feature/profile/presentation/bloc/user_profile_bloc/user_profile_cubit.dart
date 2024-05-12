import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/profile/date/gat_user_data/get_user_repo.dart/user_profile_repo_imple.dart';
import 'package:secondwork/feature/profile/presentation/bloc/user_profile_bloc/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final UserProfileRepoImple _userProfileRepoImple;
  UserProfileCubit(this._userProfileRepoImple) : super(UserProfileInitState());
  Future<void> getUserData() async {
    emit(UserProfileIsLoadingState());
    var response = await _userProfileRepoImple.getUserDate();
    response.fold(
      (failure) => emit(UserProfileFailureState(failure.message)),
      (data) => emit(
        UserProfileSuccessState(data),
      ),
    );
  }
}
