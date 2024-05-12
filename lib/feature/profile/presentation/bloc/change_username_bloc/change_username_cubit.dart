import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/profile/date/change_user_name/change_user_name_repo_imple.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_username_bloc/change_username_state.dart';

class ChangeUserNameCubit extends Cubit<ChangeUserNameState> {
  ChangeUserNameRepoImple changeUsernameRepoImple;
  ChangeUserNameCubit(this.changeUsernameRepoImple)
      : super(ChangeUserNameInitState());
  Future<void> changeUserNameMethod(Map<String, dynamic> data) async {
    emit(ChangeUserNameIsLoadingState());
    var response = await changeUsernameRepoImple.chaneUserNameMethod(data);
    response.fold(
      (failure) => emit(ChangeUserNameFailureState(failure)),
      (data) => emit(ChangeUserNameSuccessState(data)),
    );
  }
}
