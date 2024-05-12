// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_zone/zone_model/zone_model.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_zone/zone_repo/zone_repo.dart';

class ZoneRepoImpl implements ZoneRepo {
  ApiServer apiServer;
  ZoneRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, ZoneModel>> getZone(int zoneCode) async {
    try {
      var response =
          await apiServer.getMethod(endPoint: "api/get_zones/$zoneCode");
      ZoneModel cityModel = ZoneModel.fromJson(response);
      return right(cityModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
