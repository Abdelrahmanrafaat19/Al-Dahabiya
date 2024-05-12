import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';

abstract class ShoppingRepo {
  Future<Either<Failure, Map<String, dynamic>>> shoppingMethod(
      Map<String, dynamic> data);
}
