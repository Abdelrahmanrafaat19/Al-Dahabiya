import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
// import 'package:secondwork/feature/product_brands/data/product_brand_model/product_model.dart';

abstract class ProductBrandRepo {
  Future<Either<Failure, Map<String, dynamic>>> getProductBrand(int brandID);
}
