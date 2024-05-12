import 'package:secondwork/feature/home/data/brand/brand_model/brand_model.dart';

abstract class BrandState {}

class BrandInitState extends BrandState {}

class BrandIsLoadingState extends BrandState {}

class BrandSuccesstState extends BrandState {
  BrandModel brandModel;
  BrandSuccesstState(this.brandModel);
}

class BrandFailureState extends BrandState {
  dynamic message;
  BrandFailureState(this.message);
}
