import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/home/data/slider/slider_model/slider_model.dart';
import 'package:secondwork/feature/home/data/slider/slider_repo/slider_repo.dart';

class SliderRepoImple implements SliderRepo {
  ApiServer apiServer;
  SliderRepoImple(this.apiServer);
  @override
  Future<Either<Failure, SliderModel>> getSliderImages() async {
    try {
      var response = await apiServer.getMethod(endPoint: "api/slider");
      SliderModel sliderModel = SliderModel.fromJson(response);
      return right(sliderModel);
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
