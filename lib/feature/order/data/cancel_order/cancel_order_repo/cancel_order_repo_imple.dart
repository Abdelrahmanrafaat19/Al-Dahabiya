import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/order/data/cancel_order/cancel_order_repo/cancel_order_repo.dart';

class CancelOrderRepoImple implements CancelOrderRepo {
  ApiServer _apiServer;
  CancelOrderRepoImple(this._apiServer);
  @override
  Future<Either<Failure, Map<String, dynamic>>> cancelOrderMethod(
      Map<String, dynamic> data) async {
    try {
      var response = await _apiServer.postMethod(
        endPoint: "api/order/cancel",
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
