import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/profile/date/gat_user_data/get_user_model/user_profile_model.dart';

abstract class UserProfileRepo {
  Future<Either<Failure, UserProfileModel>> getUserDate();
}
