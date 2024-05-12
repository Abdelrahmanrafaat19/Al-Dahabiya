import 'package:secondwork/feature/home/data/section/section_model/section_model.dart';

abstract class SectionState {}

class SectionInitState extends SectionState {}

class SectionIsLoadingState extends SectionState {}

class SectionSuccessState extends SectionState {
  SectionModel sectionModel;
  SectionSuccessState(this.sectionModel);
}

class SectionFailureState extends SectionState {
  dynamic message;
  SectionFailureState(this.message);
}
