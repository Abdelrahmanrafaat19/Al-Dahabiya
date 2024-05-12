import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/home/data/brand/brand_model/brand_model.dart';
import 'package:secondwork/feature/home/data/brand/brand_repo/brand_repo.dart';

class BrandRepoImple implements BrandRepo {
  ApiServer apiServer;
  static BrandModel? brandsTabs;
  BrandRepoImple(this.apiServer);
  @override
  Future<Either<Failure, BrandModel>> gatBrand() async {
    try {
      var response =
          await apiServer.getMethod(endPoint: "api/brands", local: local);
      BrandModel brandModel = BrandModel.fromJson(response);
      brandModel = BrandModel.fromJson(response);
      return right(brandModel);
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
