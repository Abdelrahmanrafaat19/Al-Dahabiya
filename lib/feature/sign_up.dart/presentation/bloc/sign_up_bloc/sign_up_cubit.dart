import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/sign_up.dart/data/sign_up_repo/sign_up_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/sign_up_bloc/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpRepoImple signUpRepoImple;
  SignUpCubit(this.signUpRepoImple) : super(SignUpInitState());
  Future<void> signUpMethod(Map<String, dynamic> data) async {
    emit(SignUpIsLoadingState());
    var response = await signUpRepoImple.signUpMethod(data);
    response.fold(
      (failure) => emit(
        SignUpFailureState(failure),
      ),
      (data) => emit(
        SignUpSuccessState(data),
      ),
    );
  }
}
