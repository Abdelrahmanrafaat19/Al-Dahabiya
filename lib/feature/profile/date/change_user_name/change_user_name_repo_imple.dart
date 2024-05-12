import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/profile/date/change_user_name/change_user_name_repo.dart';

class ChangeUserNameRepoImple implements ChangeUserNameRepo {
  ApiServer _apiServer;
  ChangeUserNameRepoImple(this._apiServer);
  @override
  Future<Either<Failure, Map<String, dynamic>>> chaneUserNameMethod(
      Map<String, dynamic> data) async {
    try {
      var response = await _apiServer.postMethod(
        endPoint: "api/user/updateData",
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
