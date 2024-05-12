import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/contact_us/data/contact_us_repo/contact_us_Repo.dart';

import '../../../../core/constant/constant.dart';

class ConatactUsRepoImple extends ContactUsRepo {
  final ApiServer _apiServer;
  ConatactUsRepoImple(this._apiServer);
  @override
  Future<Either<Failure, dynamic>> contactUsMethod(dynamic data) async {
    try {
      var response = await _apiServer.postMethod(
        endPoint: "api/contactMessage",
        data: data,
        token: sharedPreferences!.getString("token"),
      );
      return right(response);
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
