import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_government/get_gevernment_repo/government_repo.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_government/model/governmernt_model.dart';

class GovernmentRepoImple implements GovernmentRepo {
  ApiServer apiServer;
  GovernmentRepoImple(this.apiServer);
  @override
  Future<Either<Failure, GovernmentModel>> getGovernmentData() async {
    try {
      var response = await apiServer.getMethod(
        endPoint: "api/governoratesdata",
      );
      GovernmentModel governmentModel = GovernmentModel.fromJson(
        response,
      );
      return right(
        governmentModel,
      );
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
