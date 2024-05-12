import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/shoping/data/shoping_repo/shopping_repo.dart';

class ShoppingRepoImple implements ShoppingRepo {
  ApiServer _apiServer;
  ShoppingRepoImple(this._apiServer);
  @override
  Future<Either<Failure, Map<String, dynamic>>> shoppingMethod(
      Map<String, dynamic> data) async {
    try {
      var response = await _apiServer.postMethod(
        endPoint: "api/orderRequest",
        data: data,
        token: sharedPreferences!.getString("token"),
      );
      print("this is Shopping repo $response");
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
