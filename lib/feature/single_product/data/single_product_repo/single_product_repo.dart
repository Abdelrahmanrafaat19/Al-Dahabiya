import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/single_product/data/single_product_model/single_product_model.dart';

abstract class SingleProductRepo {
  Future<Either<Failure, SingleProductModel>> getProductData(int productID);
}
