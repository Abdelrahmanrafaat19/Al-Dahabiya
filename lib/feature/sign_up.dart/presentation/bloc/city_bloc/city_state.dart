import 'package:secondwork/feature/sign_up.dart/data/get_city/city_model/city_model.dart';

abstract class CityState {}

class CityInitState extends CityState {}

class CityIsLoadingState extends CityState {}

class CitySuccessState extends CityState {
  CityModel cityModel;
  CitySuccessState(this.cityModel);
}

class CityFailureState extends CityState {
  dynamic message;
  CityFailureState(this.message);
}
