import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../core/constant/constant.dart';
import '../../../../../core/method.dart';

class PriceOFSingleProducetContainer extends StatelessWidget {
  final dynamic price, discount, hasDiscount;
  const PriceOFSingleProducetContainer({
    super.key,
    required this.price,
    required this.discount,
    required this.hasDiscount,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: local == "ar" ? responsiveWeidth(context, 20) : null,
      right: local == "en" ? responsiveWeidth(context, 20) : null,
      top: 125,
      child: Container(
        alignment: Alignment.center,
        width: 120.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.r),
            topLeft: Radius.circular(10.r),
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          color: SharedColor.orangeColor,
        ),
        child: Text(
          hasDiscount == true ? "$discount" : "$price",
          style: TextStyle(
            color: SharedColor.whiteColor,
            fontSize: getResponsiveFont(context, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
