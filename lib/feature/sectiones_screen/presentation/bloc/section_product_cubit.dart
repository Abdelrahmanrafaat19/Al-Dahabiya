import 'package:bloc/bloc.dart';
import 'package:secondwork/feature/sectiones_screen/data/section_product_repo/section_product_repo_imple.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/bloc/section_product_state.dart';

class SectionProductCubit extends Cubit<SectionProductState> {
  final SectionProductRepoImple _sectionProductRepoImple;
  SectionProductCubit(this._sectionProductRepoImple)
      : super(SectionProductInitState());
  Future<void> getSectionPRoductMethod(Map<String, dynamic> data) async {
    emit(SectionProductIsLoadingState());
    var response = await _sectionProductRepoImple.getSectionProductMethod(data);
    response.fold(
      (failure) => emit(
        SectionProductFailuretate(failure.message),
      ),
      (data) => emit(
        SectionProductSuccessState(data),
      ),
    );
  }
}
