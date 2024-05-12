import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_city/city_model/city_model.dart';

abstract class CityRepo {
  Future<Either<Failure, CityModel>> getCities(int governmentCode);
}
