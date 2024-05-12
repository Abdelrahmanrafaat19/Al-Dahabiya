import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/error/failure.dart';

import 'package:secondwork/feature/single_product/data/single_product_model/single_product_model.dart';
import 'package:secondwork/feature/single_product/data/single_product_repo/single_product_repo.dart';

class SingleProductRepoImple implements SingleProductRepo {
  final ApiServer _apiServer;
  SingleProductRepoImple(this._apiServer);
  @override
  Future<Either<Failure, SingleProductModel>> getProductData(
      int productID) async {
    try {
      var response = await _apiServer.getMethod(
        endPoint: "api/product/$productID",
      );
      SingleProductModel singleProductModel =
          SingleProductModel.fromJson(response);
      return right(singleProductModel);
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
