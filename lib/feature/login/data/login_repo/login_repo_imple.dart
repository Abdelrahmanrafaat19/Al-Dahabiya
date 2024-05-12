import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/login/data/login_repo/login_repo.dart';

class LoginRepoImple implements LoginRepo {
  ApiServer apiServer;
  LoginRepoImple(this.apiServer);
  @override
  Future<Either<Failure, Map<String, dynamic>>> loginMethod(
      Map<String, dynamic> data) async {
    try {
      var response =
          await apiServer.postMethod(endPoint: "api/login", data: data);
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
