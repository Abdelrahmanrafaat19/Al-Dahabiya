import 'package:dartz/dartz.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/home/data/offer/offer_model/offer_model.dart';

abstract class OfferRepo {
  Future<Either<Failure, OfferModel>> getOffers();
}
