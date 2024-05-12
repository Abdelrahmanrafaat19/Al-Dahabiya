import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/home/data/brand/brand_model/brand_model.dart';

abstract class BrandRepo {
  Future<Either<Failure, BrandModel>> gatBrand();
}
