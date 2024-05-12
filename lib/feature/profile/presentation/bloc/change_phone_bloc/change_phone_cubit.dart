import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/profile/date/change_phone_repo/change_phone_repo_imple.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_phone_bloc/change_phone_state.dart';

class ChangePhoneCubit extends Cubit<ChangePhoneState> {
  ChangePhoneRepoImple changePhoneRepoImple;
  ChangePhoneCubit(this.changePhoneRepoImple) : super(ChangePhoneInitState());
  Future<void> changePhoneMethod(Map<String, dynamic> data) async {
    emit(ChangePhoneIsLoadingState());
    var response = await changePhoneRepoImple.chanePhoneMethod(data);
    response.fold(
      (failure) => emit(ChangePhoneFailureState(failure)),
      (data) => emit(ChangePhoneSuccessState(data)),
    );
  }
}
