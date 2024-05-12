import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/home/data/filre_offers.dart/model/filter_order_product.dart';

abstract class OfferFilterRepo {
  Future<Either<Failure, OfferFilterProductModel>> getProductOffer(int offerID);
}
