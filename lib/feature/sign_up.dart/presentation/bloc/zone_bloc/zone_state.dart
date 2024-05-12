import 'package:secondwork/feature/sign_up.dart/data/get_zone/zone_model/zone_model.dart';

abstract class ZoneState {}

class ZoneInitState extends ZoneState {}

class ZoneIsLoadingState extends ZoneState {}

class ZoneSuccessState extends ZoneState {
  ZoneModel zoneModel;
  ZoneSuccessState(this.zoneModel);
}

class ZoneFailureState extends ZoneState {
  dynamic message;
  ZoneFailureState(this.message);
}
