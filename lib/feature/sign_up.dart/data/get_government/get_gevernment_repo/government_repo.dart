import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_government/model/governmernt_model.dart';

abstract class GovernmentRepo {
  Future<Either<Failure, GovernmentModel>> getGovernmentData();
}
