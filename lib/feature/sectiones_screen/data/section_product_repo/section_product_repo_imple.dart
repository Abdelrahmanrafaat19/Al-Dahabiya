import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/sectiones_screen/data/section_product_model/section_product_model.dart';
import 'package:secondwork/feature/sectiones_screen/data/section_product_repo/section_product_repo.dart';

class SectionProductRepoImple implements SectionsProductRepo {
  ApiServer _apiServer;
  SectionProductRepoImple(this._apiServer);
  @override
  Future<Either<Failure, SectionsProductModel>> getSectionProductMethod(
      Map<String, dynamic> data) async {
    try {
      var response = await _apiServer.postMethod(
          endPoint: "api/searchByFilter", data: data);
      SectionsProductModel sectionProductRepoModel =
          SectionsProductModel.fromJson(response);
      return right(sectionProductRepoModel);
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
