import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/profile/date/change_password_repo/change_password_repo_imple.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_password_bloc/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordRepoImple changePasswordRepoImple;
  ChangePasswordCubit(this.changePasswordRepoImple)
      : super(ChangePasswordInitState());
  Future<void> changePasswordMethod(Map<String, dynamic> data) async {
    emit(ChangePasswordIsLoadingState());
    var response = await changePasswordRepoImple.chanePasswordMethod(data);
    response.fold(
      (failure) => emit(ChangePasswordFailureState(failure)),
      (data) => emit(ChangePasswordSuccessState(data)),
    );
  }
}
