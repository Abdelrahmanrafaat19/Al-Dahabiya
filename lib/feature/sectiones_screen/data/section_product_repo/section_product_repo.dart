import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/sectiones_screen/data/section_product_model/section_product_model.dart';

abstract class SectionsProductRepo {
  Future<Either<Failure, SectionsProductModel>> getSectionProductMethod(
      Map<String, SectionsProductModel> data);
}
