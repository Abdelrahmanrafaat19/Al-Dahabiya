import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/profile/date/change_password_repo/change_password_repo.dart';

class ChangePasswordRepoImple implements ChangePasswordRepo {
  final ApiServer _apiServer;
  ChangePasswordRepoImple(this._apiServer);
  @override
  Future<Either<Failure, Map<String, dynamic>>> chanePasswordMethod(
      Map<String, dynamic> data) async {
    try {
      var response = await _apiServer.postMethod(
        endPoint: "api/myinfo/update_password",
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
