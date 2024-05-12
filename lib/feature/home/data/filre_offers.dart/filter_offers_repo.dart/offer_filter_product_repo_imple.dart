import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/error/failure.dart';
import 'package:secondwork/feature/home/data/filre_offers.dart/filter_offers_repo.dart/offer_filter_product.dart';
import 'package:secondwork/feature/home/data/filre_offers.dart/model/filter_order_product.dart';

class OfferFilterRepoImple implements OfferFilterRepo {
  ApiServer apiServer;
  OfferFilterRepoImple(this.apiServer);
  @override
  Future<Either<Failure, OfferFilterProductModel>> getProductOffer(
      int offerID) async {
    try {
      var response = await apiServer.getMethod(
          endPoint: "api/offer/products/$offerID", local: local);
      OfferFilterProductModel offerFilterProductModel =
          OfferFilterProductModel.fromJson(response);
      return right(offerFilterProductModel);
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
