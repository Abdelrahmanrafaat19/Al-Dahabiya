import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/cart/presentation/bloc/get_cart_data_cubit/get_cart_data_cubit.dart';
import 'package:secondwork/feature/shoping/presentation/views/shoping_screen.dart';
import 'package:secondwork/generated/l10n.dart';

// ignore: must_be_immutable
class BottomContainerCart extends StatelessWidget {
  dynamic totalPrice, count;
  BottomContainerCart({
    super.key,
    required this.totalPrice,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWeidth(context, 15),
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: SharedColor.greyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: " $count ${S.of(context).product}",
                  color: Colors.black,
                  fontSize: getResponsiveFont(context, fontSize: 20),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    customText(
                      text: "${S.of(context).totle}:",
                      color: SharedColor.mainColor,
                      fontSize: getResponsiveFont(context, fontSize: 20),
                      fontWeight: FontWeight.bold,
                    ),
                    Expanded(
                      child: customText(
                        text: " $totalPrice ${S.of(context).EG}",
                        color: Colors.black,
                        fontSize: getResponsiveFont(context, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                if (GetCartDataCubit.notes.isNotEmpty) {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const ShopingScreen(),
                    ),
                  );
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
              child: Container(
                alignment: Alignment.center,
                width: responsiveWeidth(context, 200),
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: SharedColor.mainColor,
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: customText(
                    text: S.of(context).buy,
                    color: SharedColor.whiteColor,
                    fontSize: getResponsiveFont(context, fontSize: 35),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
