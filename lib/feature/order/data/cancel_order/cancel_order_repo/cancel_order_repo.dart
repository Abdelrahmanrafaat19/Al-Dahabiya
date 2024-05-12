import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';

abstract class CancelOrderRepo {
  Future<Either<Failure, Map<String, dynamic>>> cancelOrderMethod(
      Map<String, dynamic> data);
}
