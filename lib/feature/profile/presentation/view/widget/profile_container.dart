import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/cart/presentation/bloc/get_cart_data_cubit/get_cart_data_cubit.dart';
import 'package:secondwork/feature/contact_us/presentation/views/contact_us.dart';
import 'package:secondwork/feature/home/presentation/bloc/brandes_bloc/brand_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/offer_bloc/offer_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/section_bloc/section_cubit.dart';
import 'package:secondwork/feature/layout/localization/loclization_cubit.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';
import 'package:secondwork/feature/order/presentation/view/all_order.dart';
import 'package:secondwork/feature/profile/presentation/view/change_password.dart';
import 'package:secondwork/feature/profile/presentation/view/edit_profile.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/profile_buttons.dart';
import 'package:secondwork/feature/shoping/presentation/views/shoping_screen.dart';

import 'package:secondwork/generated/l10n.dart';

import '../../../../../core/method.dart';
import '../../../../../core/scal_factor_method.dart';

// ignore: must_be_immutable
class ProfileContainer extends StatefulWidget {
  dynamic points;
  ProfileContainer({
    super.key,
    required this.points,
  });

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: responsiveWeidth(
          context,
          10,
        ),
        right: responsiveWeidth(
          context,
          10,
        ),
        bottom: 20.h,
        top: 30.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: SharedColor.whiteColor,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
            color: Colors.black, width: responsiveWeidth(context, 1.5)),
      ),
      child: ResponsiveGridList(
        scroll: false,
        shrinkWrap: true,
        desiredItemWidth: 300,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditPofileScreen(),
              ));
            },
            child: ProfilrButtons(
              leftIcon: Icons.edit,
              reightIcon: Icons.arrow_forward_ios_outlined,
              text: S.of(context).editprofile,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AllOrderScreen(),
            )),
            child: ProfilrButtons(
              leftIcon: Icons.add_location_outlined,
              reightIcon: Icons.arrow_forward_ios_outlined,
              text: S.of(context).order,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          InkWell(
            onTap: () {
              if (GetCartDataCubit.notes.isNotEmpty) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ShopingScreen(),
                ));
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: Center(
                        child: customText(
                          text: "Your Cart is Empty",
                          color: SharedColor.mainColor,
                          fontSize: getResponsiveFont(context, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
            child: ProfilrButtons(
              leftIcon: Icons.attach_money_sharp,
              reightIcon: Icons.arrow_forward_ios_outlined,
              text: S.of(context).shopping,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: SizedBox(
                    width: 100.w,
                    height: 100.h,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                          text: "${S.of(context).points}: ",
                          color: SharedColor.greyFieldColor,
                          fontSize: getResponsiveFont(context, fontSize: 20),
                          fontWeight: FontWeight.bold,
                        ),
                        customText(
                          text: "${widget.points}",
                          color: Colors.black,
                          fontSize: getResponsiveFont(context, fontSize: 20),
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    )),
                  ),
                ),
              );
            },
            child: ProfilrButtons(
              leftIcon: Icons.point_of_sale_outlined,
              reightIcon: Icons.arrow_forward_ios_outlined,
              text: S.of(context).points,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreed(),
                ),
              );
            },
            child: ProfilrButtons(
              leftIcon: Icons.lock,
              reightIcon: Icons.arrow_forward_ios_outlined,
              text: S.of(context).changepassword,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          InkWell(
            onTap: () {
              if (Intl.getCurrentLocale() == "ar") {
                BlocProvider.of<LocaleCubit>(context).changeLanguage("en");
                local = "en";
              } else {
                Intl.systemLocale = "ar";
                BlocProvider.of<LocaleCubit>(context).changeLanguage("ar");
                local = "ar";
              }
              BlocProvider.of<BrandCubit>(context).getBarnd();
              BlocProvider.of<SectionCubit>(context).getSection();
              BlocProvider.of<OfferCubit>(context).getOffers();
              setState(() {});
            },
            child: ProfilrButtons(
              leftIcon: Icons.translate,
              reightIcon: Icons.arrow_forward_ios_outlined,
              text: S.of(context).changelanguage,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ContactUsScreen(),
              ));
            },
            child: ProfilrButtons(
              leftIcon: Icons.phone_android_outlined,
              reightIcon: Icons.arrow_forward_ios_outlined,
              text: S.of(context).contactus,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          InkWell(
            onTap: () async {
              sharedPreferences!.setString("token", "");
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false);
            },
            child: Container(
              alignment: Alignment.center,
              child: customText(
                  color: SharedColor.mainColor,
                  text: S.of(context).signout,
                  fontSize: getResponsiveFont(context, fontSize: 30),
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
