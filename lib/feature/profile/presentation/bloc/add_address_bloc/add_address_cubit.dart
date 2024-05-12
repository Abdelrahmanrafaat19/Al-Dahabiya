import 'package:bloc/bloc.dart';
import 'package:secondwork/feature/profile/date/add_address_repo.dart/add_address_repo_imple.dart';
import 'package:secondwork/feature/profile/presentation/bloc/add_address_bloc/add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  AddAddressRepoImple addAddressRepoImple;
  AddAddressCubit(this.addAddressRepoImple) : super(AddAddressInitState());
  Future<void> addAddressMethod(Map<String, dynamic> data) async {
    emit(AddAddressIsLoadingState());
    var response = await addAddressRepoImple.addAddressMethod(data);
    print("thie add cubit $data");
    response.fold(
      (failure) => emit(AddAddressFailureState(failure)),
      (data) => emit(AddAddressSuccessState(data)),
    );
  }
}
