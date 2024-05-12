import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';

import '../../../../../core/scal_factor_method.dart';
import '../../../../../core/theme/color.dart';

class QuantityIncrementAddDecrementRowSinglPRoduct extends StatelessWidget {
  final void Function()? incrementFun, decrementFun;
  final int quantity;
  const QuantityIncrementAddDecrementRowSinglPRoduct({
    super.key,
    required this.decrementFun,
    required this.incrementFun,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: incrementFun,
          child: CircleAvatar(
            radius: getResponsiveFont(context, fontSize: 20),
            backgroundColor: SharedColor.mainColor,
            child: const Icon(
              Icons.add,
              color: SharedColor.whiteColor,
            ),
          ),
        ),
        SizedBox(
          width: 20.h,
        ),
        customText(
          text: "$quantity",
          color: Colors.black,
          fontSize: getResponsiveFont(context, fontSize: 20),
        ),
        SizedBox(
          width: 20.h,
        ),
        InkWell(
          onTap: decrementFun,
          child: CircleAvatar(
            radius: getResponsiveFont(context, fontSize: 20),
            backgroundColor: SharedColor.mainColor,
            child: const Icon(
              Icons.remove,
              color: SharedColor.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
