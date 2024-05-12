import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_zone/zone_model/zone_model.dart';

abstract class ZoneRepo {
  Future<Either<Failure, ZoneModel>> getZone(int zoneCode);
}
