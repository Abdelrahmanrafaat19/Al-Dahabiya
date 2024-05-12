import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';

abstract class LoginRepo {
  Future<Either<Failure, Map<String, dynamic>>> loginMethod(
      Map<String, dynamic> data);
}
