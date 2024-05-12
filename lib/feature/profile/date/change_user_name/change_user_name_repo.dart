import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';

abstract class ChangeUserNameRepo {
  Future<Either<Failure, Map<String, dynamic>>> chaneUserNameMethod(
      Map<String, dynamic> data);
}
