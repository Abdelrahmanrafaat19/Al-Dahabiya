import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';

abstract class ChangePhoneRepo {
  Future<Either<Failure, Map<String, dynamic>>> chanePhoneMethod(
      Map<String, dynamic> data);
}
