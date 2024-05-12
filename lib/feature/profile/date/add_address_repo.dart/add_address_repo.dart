import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';

abstract class AddAddressRepo {
  Future<Either<Failure, Map<String, dynamic>>> addAddressMethod(
      Map<String, dynamic> data);
}
