import 'package:dartz/dartz.dart';
import 'package:secondwork/feature/profile/date/get_user_address/user_address_model/user_address_model.dart';

import '../../../../../core/error/failure.dart';

abstract class UserAddressRepo {
  Future<Either<Failure, UserAddressModel>> getUserAddress();
}
