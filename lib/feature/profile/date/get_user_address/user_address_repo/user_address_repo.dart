import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/profile/date/get_user_address/user_address_model/user_address_model.dart';
import 'package:secondwork/feature/profile/date/get_user_address/user_address_repo/user_address_repo_imple.dart';

class UserAddressRepoImple implements UserAddressRepo {
  final ApiServer _apiServer;
  UserAddressRepoImple(this._apiServer);
  @override
  Future<Either<Failure, UserAddressModel>> getUserAddress() async {
    try {
      var response = await _apiServer.getMethod(
        endPoint: "api/user/addresses",
        token: sharedPreferences!.getString("token"),
      );

      UserAddressModel userAddressModel = UserAddressModel.fromJson(response);
      return right(userAddressModel);
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
