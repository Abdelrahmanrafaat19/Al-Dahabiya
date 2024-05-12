import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:secondwork/core/api_servec.dart';
import 'package:secondwork/feature/contact_us/data/contact_us_repo/contact_us_repo_imple.dart';
import 'package:secondwork/feature/home/data/brand/brand_repo/brand_repo_imple.dart';
import 'package:secondwork/feature/home/data/filre_offers.dart/filter_offers_repo.dart/offer_filter_product_repo_imple.dart';
import 'package:secondwork/feature/home/data/offer/offer_repo/offer_repo_Imple.dart';
import 'package:secondwork/feature/home/data/section/section_repo/section_repo_imple.dart';
import 'package:secondwork/feature/home/data/slider/slider_repo/slider_repo_imple.dart';
import 'package:secondwork/feature/login/data/login_repo/login_repo_imple.dart';
import 'package:secondwork/feature/order/data/all_order_repo/all_order_repo_imple.dart';
import 'package:secondwork/feature/order/data/cancel_order/cancel_order_repo/cancel_order_repo_imple.dart';
import 'package:secondwork/feature/product_brands/data/product_brand_repo/product_brand_repo_imple.dart';
import 'package:secondwork/feature/profile/date/add_address_repo.dart/add_address_repo_imple.dart';
import 'package:secondwork/feature/profile/date/change_password_repo/change_password_repo_imple.dart';
import 'package:secondwork/feature/profile/date/change_phone_repo/change_phone_repo_imple.dart';
import 'package:secondwork/feature/profile/date/change_user_name/change_user_name_repo_imple.dart';
import 'package:secondwork/feature/profile/date/gat_user_data/get_user_repo.dart/user_profile_repo_imple.dart';
import 'package:secondwork/feature/profile/date/get_user_address/user_address_repo/user_address_repo.dart';
import 'package:secondwork/feature/sectiones_screen/data/section_product_repo/section_product_repo_imple.dart';
import 'package:secondwork/feature/shoping/data/shoping_repo/shoping_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_city/city_repo/city_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_government/get_gevernment_repo/governmernt_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_zone/zone_repo/zone_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/data/sign_up_repo/sign_up_repo_imple.dart';
import 'package:secondwork/feature/single_product/data/single_product_repo/single_product_repo_imple.dart';

var getit = GetIt.instance;

void setUp() {
  getit.registerSingleton<ApiServer>(
    ApiServer(Dio()),
  );
  getit.registerSingleton<LoginRepoImple>(
    LoginRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<SignUpRepoImple>(
    SignUpRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<GovernmentRepoImple>(
    GovernmentRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<CityRepoImple>(
    CityRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<ZoneRepoImpl>(
    ZoneRepoImpl(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<SliderRepoImple>(
    SliderRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<OfferRepoImple>(
    OfferRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<BrandRepoImple>(
    BrandRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<SectionRepoImpl>(
    SectionRepoImpl(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<ProductBrandRepoImple>(
    ProductBrandRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<OfferFilterRepoImple>(
    OfferFilterRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<ChangePhoneRepoImple>(
    ChangePhoneRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<ChangeUserNameRepoImple>(
    ChangeUserNameRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<ChangePasswordRepoImple>(
    ChangePasswordRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<AddAddressRepoImple>(
    AddAddressRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<UserAddressRepoImple>(
    UserAddressRepoImple(
      getit.get<ApiServer>(),
    ),
  );

  getit.registerSingleton<ConatactUsRepoImple>(
    ConatactUsRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<SingleProductRepoImple>(
    SingleProductRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<SectionProductRepoImple>(
    SectionProductRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<UserProfileRepoImple>(
    UserProfileRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<AllOrderRepoImple>(
    AllOrderRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<CancelOrderRepoImple>(
    CancelOrderRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<ShoppingRepoImple>(
    ShoppingRepoImple(
      getit.get<ApiServer>(),
    ),
  );
}
