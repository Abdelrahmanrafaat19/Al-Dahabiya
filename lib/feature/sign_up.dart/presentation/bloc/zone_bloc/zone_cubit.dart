import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_zone/zone_repo/zone_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/zone_bloc/zone_state.dart';

class ZoneCubit extends Cubit<ZoneState> {
  ZoneRepoImpl zoneRepoImpl;
  ZoneCubit(this.zoneRepoImpl) : super(ZoneInitState());
  Future<void> getZoneMethod(int zoneCode) async {
    emit(ZoneIsLoadingState());
    var response = await zoneRepoImpl.getZone(zoneCode);
    response.fold(
      (failure) => emit(ZoneFailureState(failure.message)),
      (data) => emit(
        ZoneSuccessState(data),
      ),
    );
  }
}
