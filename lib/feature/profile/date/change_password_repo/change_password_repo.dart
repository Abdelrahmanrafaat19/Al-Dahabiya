import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';

abstract class ChangePasswordRepo {
  Future<Either<Failure, Map<String, dynamic>>> chanePasswordMethod(
      Map<String, dynamic> data);
}
