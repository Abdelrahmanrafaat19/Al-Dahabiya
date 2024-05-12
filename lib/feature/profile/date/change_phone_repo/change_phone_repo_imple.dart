import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/profile/date/change_phone_repo/change_phone_repo.dart';

class ChangePhoneRepoImple implements ChangePhoneRepo {
  ApiServer _apiServer;
  ChangePhoneRepoImple(this._apiServer);
  @override
  Future<Either<Failure, Map<String, dynamic>>> chanePhoneMethod(
      Map<String, dynamic> data) async {
    try {
      var response = await _apiServer.postMethod(
        endPoint: "api/myinfo/profile_edit_phone",
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
