import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/home/data/slider/slider_model/slider_model.dart';

abstract class SliderRepo {
  Future<Either<Failure, SliderModel>> getSliderImages();
}
