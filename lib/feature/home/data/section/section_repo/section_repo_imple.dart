import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/home/data/section/section_model/section_model.dart';
import 'package:secondwork/feature/home/data/section/section_repo/section_repo.dart';

class SectionRepoImpl implements SectionRepo {
  ApiServer apiServer;
  static SectionModel? sectionTabs;
  SectionRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, SectionModel>> getSections() async {
    try {
      var response =
          await apiServer.getMethod(endPoint: "api/categories", local: local);
      SectionModel sectionModel = SectionModel.fromJson(response);
      sectionTabs = SectionModel.fromJson(response);
      return right(sectionModel);
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
