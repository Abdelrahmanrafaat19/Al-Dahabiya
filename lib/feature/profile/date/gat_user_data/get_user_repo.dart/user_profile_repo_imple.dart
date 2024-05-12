import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/profile/date/gat_user_data/get_user_model/user_profile_model.dart';
import 'package:secondwork/feature/profile/date/gat_user_data/get_user_repo.dart/user_profile_repo.dart';

class UserProfileRepoImple implements UserProfileRepo {
  final ApiServer _apiServer;
  UserProfileRepoImple(this._apiServer);
  @override
  Future<Either<Failure, UserProfileModel>> getUserDate() async {
    try {
      var response = await _apiServer.getMethod(
        endPoint: "api/user",
        token: sharedPreferences!.getString("token"),
      );
      UserProfileModel userProfileModel = UserProfileModel.fromJson(response);
      return right(userProfileModel);
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
