import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/feature/home/data/section/section_repo/section_repo_imple.dart';
import 'package:secondwork/feature/home/presentation/bloc/section_bloc/section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionRepoImpl sectionRepoImpl;
  SectionCubit(this.sectionRepoImpl) : super(SectionInitState());
  Future<void> getSection() async {
    emit(SectionIsLoadingState());
    var response = await sectionRepoImpl.getSections();
    response.fold(
      (failure) => emit(SectionFailureState(failure.message)),
      (data) => emit(
        SectionSuccessState(data),
      ),
    );
  }
}
