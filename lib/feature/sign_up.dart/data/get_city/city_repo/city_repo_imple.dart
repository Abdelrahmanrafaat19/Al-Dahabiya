import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_city/city_model/city_model.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_city/city_repo/city_repo.dart';

class CityRepoImple implements CityRepo {
  ApiServer apiServer;
  CityRepoImple(this.apiServer);
  @override
  Future<Either<Failure, CityModel>> getCities(int governmentCode) async {
    try {
      var response =
          await apiServer.getMethod(endPoint: "api/get_cities/$governmentCode");
      CityModel cityModel = CityModel.fromJson(response);
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
