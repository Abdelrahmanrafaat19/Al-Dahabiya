import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/home/data/offer/offer_model/offer_model.dart';
import 'package:secondwork/feature/home/data/offer/offer_repo/offer_repo.dart';
import 'package:secondwork/core/constant/constant.dart';

class OfferRepoImple implements OfferRepo {
  ApiServer apiServer;
  OfferRepoImple(this.apiServer);
  @override
  Future<Either<Failure, OfferModel>> getOffers() async {
    try {
      var response = await apiServer.getMethod(
          endPoint: "api/latest_offers", local: local);
      OfferModel offerModel = OfferModel.fromJson(response);
      return right(offerModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
