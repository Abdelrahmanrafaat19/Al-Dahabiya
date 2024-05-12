import 'package:bloc/bloc.dart';
import 'package:secondwork/feature/contact_us/data/contact_us_repo/contact_us_repo_imple.dart';
import 'package:secondwork/feature/contact_us/presentation/bloc/contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final ConatactUsRepoImple _conatactUsRepoImple;
  ContactUsCubit(this._conatactUsRepoImple) : super(ContactUsInitState());
  Future<void> contactUsMethod(dynamic data) async {
    emit(ContactUsIsLoadingState());
    var response = await _conatactUsRepoImple.contactUsMethod(data);
    response.fold(
      (failure) => emit(ContactUsFailureState(failure.message)),
      (data) => emit(
        ContactUsSuccessState(data),
      ),
    );
  }
}
