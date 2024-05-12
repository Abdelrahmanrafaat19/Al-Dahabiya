import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/order/data/all_order_model/all_order_model.dart';

abstract class AllOrderRepo {
  Future<Either<Failure, AllOrderModel>> getAllOrderDate();
}
