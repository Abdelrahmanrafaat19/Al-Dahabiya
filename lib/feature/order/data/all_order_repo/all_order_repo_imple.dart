import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/order/data/all_order_model/all_order_model.dart';
import 'package:secondwork/feature/order/data/all_order_repo/all_order_repo.dart';

class AllOrderRepoImple implements AllOrderRepo {
  final ApiServer _apiServer;
  AllOrderRepoImple(this._apiServer);

  @override
  Future<Either<Failure, AllOrderModel>> getAllOrderDate() async {
    try {
      var response = await _apiServer.getMethod(
        endPoint: "api/mypurchases",
        token: sharedPreferences!.getString("token"),
      );
      AllOrderModel userProfileModel = AllOrderModel.fromJson(response);
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
