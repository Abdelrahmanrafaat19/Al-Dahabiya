import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_government/get_gevernment_repo/governmernt_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/government_bloc/government_state.dart';

class GovernmentCubit extends Cubit<GovernmentState> {
  GovernmentRepoImple governmentRepoImple;
  GovernmentCubit(this.governmentRepoImple) : super(GovernmentInitState());
  Future<void> getGovernmentMethod() async {
    emit(GovernmentIsLoadingState());
    var response = await governmentRepoImple.getGovernmentData();
    response.fold(
      (
        failure,
      ) =>
          emit(
        GovernmentFailureState(
          failure.message,
        ),
      ),
      (
        data,
      ) =>
          emit(
        GovernmentSuccessState(
          data,
        ),
      ),
    );
  }
}
