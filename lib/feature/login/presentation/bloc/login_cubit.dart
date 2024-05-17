import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/login/data/login_repo/login_repo_imple.dart';
import 'package:secondwork/feature/login/presentation/bloc/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepoImple loginRepoImple;
  LoginCubit(this.loginRepoImple) : super(LoginInitState());
  Future<void> loginMethod(Map<String, dynamic> data) async {
    emit(LoginLoadingState());
    var localStorge = await SharedPreferences.getInstance();
    var response = await loginRepoImple.loginMethod(data);

    response.fold((faluire) => emit(LoginFailureState(faluire.message)),
        (data) {
      if (data["code"] == 200) {
        localStorge.setString("token", data["data"]["token"]);
        emit(
          LoginSaccussState(data),
        );
      } else {
        emit(
          LoginSaccussState(data),
        );
      }
    });
  }
}
