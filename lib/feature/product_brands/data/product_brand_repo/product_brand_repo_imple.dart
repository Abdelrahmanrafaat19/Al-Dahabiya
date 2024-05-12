import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/product_brands/data/product_brand_repo/product_brand_repo.dart';

class ProductBrandRepoImple implements ProductBrandRepo {
  ApiServer apiServer;
  ProductBrandRepoImple(this.apiServer);
  @override
  Future<Either<Failure, Map<String, dynamic>>> getProductBrand(
      int brandID) async {
    try {
      var response = await apiServer.getMethod(
          endPoint: "api/brands/products/$brandID", local: local);

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
