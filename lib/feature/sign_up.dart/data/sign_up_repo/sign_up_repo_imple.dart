import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/sign_up.dart/data/sign_up_repo/sign_up_repo.dart';

class SignUpRepoImple implements SignUpRepo {
  ApiServer apiServer;
  SignUpRepoImple(this.apiServer);
  @override
  Future<Either<Failure, Map<String, dynamic>>> signUpMethod(
      Map<String, dynamic> data) async {
    try {
      var response = await apiServer.postMethod(
        endPoint: "api/signup",
        data: data,
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
