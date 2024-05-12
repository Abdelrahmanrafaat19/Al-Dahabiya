import 'package:secondwork/feature/sectiones_screen/data/section_product_model/section_product_model.dart';

abstract class SectionProductState {}

class SectionProductInitState extends SectionProductState {}

class SectionProductIsLoadingState extends SectionProductState {}

class SectionProductIsEmptyState extends SectionProductState {}

class SectionProductSuccessState extends SectionProductState {
  SectionsProductModel sectionsProductModel;
  SectionProductSuccessState(this.sectionsProductModel);
}

class SectionProductFailuretate extends SectionProductState {
  dynamic message;
  SectionProductFailuretate(this.message);
}
