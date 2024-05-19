import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/locator.dart';
import 'package:secondwork/feature/cart/data/cart_model/cart_model.dart';
import 'package:secondwork/feature/cart/presentation/bloc/add_cart_data_cubit/add_cart_data_cubit.dart';
import 'package:secondwork/feature/cart/presentation/bloc/get_cart_data_cubit/get_cart_data_cubit.dart';
import 'package:secondwork/feature/contact_us/data/contact_us_repo/contact_us_repo_imple.dart';
import 'package:secondwork/feature/contact_us/presentation/bloc/contact_us_cubit.dart';
import 'package:secondwork/feature/home/data/brand/brand_repo/brand_repo_imple.dart';
import 'package:secondwork/feature/home/data/filre_offers.dart/filter_offers_repo.dart/offer_filter_product_repo_imple.dart';
import 'package:secondwork/feature/home/data/offer/offer_repo/offer_repo_Imple.dart';
import 'package:secondwork/feature/home/data/section/section_repo/section_repo_imple.dart';
import 'package:secondwork/feature/home/data/slider/slider_repo/slider_repo_imple.dart';
import 'package:secondwork/feature/home/presentation/bloc/brandes_bloc/brand_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/offer_bloc/offer_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/offer_filter_product/offer_product_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/section_bloc/section_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/slider_bloc/slider_cubit.dart';
import 'package:secondwork/feature/layout/bottom_navigation_bar/presentation/views/bottom_bar_screen.dart';
import 'package:secondwork/feature/layout/localization/localiztion_state.dart';
import 'package:secondwork/feature/login/data/login_repo/login_repo_imple.dart';
import 'package:secondwork/feature/login/presentation/bloc/login_cubit.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';
import 'package:secondwork/feature/order/data/all_order_repo/all_order_repo_imple.dart';
import 'package:secondwork/feature/order/data/cancel_order/cancel_order_repo/cancel_order_repo_imple.dart';
import 'package:secondwork/feature/order/presentation/bloc/all_order_cubit.dart';
import 'package:secondwork/feature/order/presentation/bloc/cancel_order_bloc/cancel_order_cubit.dart';
import 'package:secondwork/feature/product_brands/data/product_brand_repo/product_brand_repo_imple.dart';
import 'package:secondwork/feature/product_brands/presentation/bloc/product_brand_bloc/product_brand_cubit.dart';
import 'package:secondwork/feature/profile/date/add_address_repo.dart/add_address_repo_imple.dart';
import 'package:secondwork/feature/profile/date/change_password_repo/change_password_repo_imple.dart';
import 'package:secondwork/feature/profile/date/change_phone_repo/change_phone_repo_imple.dart';
import 'package:secondwork/feature/profile/date/change_user_name/change_user_name_repo_imple.dart';
import 'package:secondwork/feature/profile/date/gat_user_data/get_user_repo.dart/user_profile_repo_imple.dart';
import 'package:secondwork/feature/profile/date/get_user_address/user_address_repo/user_address_repo.dart';
import 'package:secondwork/feature/profile/presentation/bloc/add_address_bloc/add_address_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_password_bloc/change_password_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_phone_bloc/change_phone_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_username_bloc/change_username_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/user_address_bloc/user_address_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/user_profile_bloc/user_profile_cubit.dart';
import 'package:secondwork/feature/sectiones_screen/data/section_product_repo/section_product_repo_imple.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/bloc/section_product_cubit.dart';
import 'package:secondwork/feature/shoping/data/shoping_repo/shoping_repo_imple.dart';
import 'package:secondwork/feature/shoping/presentation/bloc/cubit/shopping_cubit.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_city/city_repo/city_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_government/get_gevernment_repo/governmernt_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/data/get_zone/zone_repo/zone_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/data/sign_up_repo/sign_up_repo_imple.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/city_bloc/city_cubit.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/government_bloc/government_cubit.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/sign_up_bloc/sign_up_cubit.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/zone_bloc/zone_cubit.dart';
import 'package:secondwork/feature/single_product/data/single_product_repo/single_product_repo_imple.dart';
import 'package:secondwork/feature/single_product/presentation/bloc/single_product_cubit.dart';
import 'package:secondwork/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/layout/localization/loclization_cubit.dart';
// import 'feature/splash_screen/splash_screen.dart';

void main() async {
  BindingBase.debugZoneErrorsAreFatal = true;
  setUp();
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.checkPermission();
  await Geolocator.requestPermission();
  await Hive.initFlutter();
  Hive.registerAdapter(CartProductDataAdapter());
  await Hive.openBox<CartProductData>("cart_box").then(
    (value) => debugPrint("The CartBox is Created"),
  );
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool user = false;

  @override
  void initState() {
    check();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LocaleCubit()..getSavedLanguage(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(getit.get<LoginRepoImple>()),
            ),
            BlocProvider(
              create: (context) => SignUpCubit(getit.get<SignUpRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  GovernmentCubit(getit.get<GovernmentRepoImple>()),
            ),
            BlocProvider(
              create: (context) => CityCubit(getit.get<CityRepoImple>()),
            ),
            BlocProvider(
              create: (context) => ZoneCubit(getit.get<ZoneRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  SliderCubit(getit.get<SliderRepoImple>())..getSliderImage(),
            ),
            BlocProvider(
              create: (context) =>
                  OfferCubit(getit.get<OfferRepoImple>())..getOffers(),
            ),
            BlocProvider(
              create: (context) =>
                  BrandCubit(getit.get<BrandRepoImple>())..getBarnd(),
            ),
            BlocProvider(
              create: (context) =>
                  SectionCubit(getit.get<SectionRepoImpl>())..getSection(),
            ),
            BlocProvider(
              create: (context) =>
                  ProductBrandCubit(getit.get<ProductBrandRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  OfferProductCubit(getit.get<OfferFilterRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  ChangePhoneCubit(getit.get<ChangePhoneRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  ChangeUserNameCubit(getit.get<ChangeUserNameRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  ChangePasswordCubit(getit.get<ChangePasswordRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  AddAddressCubit(getit.get<AddAddressRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  UserAddressCubit(getit.get<UserAddressRepoImple>())
                    ..getUserAddressMethod(),
            ),
            BlocProvider(
              create: (context) =>
                  ContactUsCubit(getit.get<ConatactUsRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  SingleProductCubit(getit.get<SingleProductRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  SectionProductCubit(getit.get<SectionProductRepoImple>())
                    ..getSectionPRoductMethod({
                      "cat": catID,
                      "categories": [catID],
                      "brands": [],
                      "options": [],
                      "price": [price1, 1000],
                      "sort": "desc"
                      // "paginate":1
                    }),
            ),
            BlocProvider(
              create: (context) =>
                  UserProfileCubit(getit.get<UserProfileRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  AllOrderCubit(getit.get<AllOrderRepoImple>()),
            ),
            BlocProvider(
              create: (context) =>
                  CancelOrderCubit(getit.get<CancelOrderRepoImple>()),
            ),
            BlocProvider(
              create: (context) => AddCartDataCubit(),
            ),
            BlocProvider(
              create: (context) => GetCartDataCubit()..fetchAllNotes(),
            ),
            BlocProvider(
              create: (context) =>
                  ShoppingCubit(getit.get<ShoppingRepoImple>()),
            ),
          ],
          child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
            return MaterialApp(
              locale: state.locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: child,
            );
          }),
        );
      },
      child: user == false ? const LoginScreen() : const BottomBarScreen(),
    );
  }

  check() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      String id = sharedPreferences.getString('token')!;
      if (id.isNotEmpty) {
        user = true;
      } else {
        user = false;
      }
    } catch (e) {
      user = false;
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == "ar";
}
