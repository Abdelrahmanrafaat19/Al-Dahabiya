import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../core/scal_factor_method.dart';

// ignore: must_be_immutable
class QuantityColumnCart extends StatelessWidget {
  void Function()? increment, decrement;
  int quantity;
  QuantityColumnCart({
    super.key,
    required this.decrement,
    required this.increment,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: increment,
            child: CircleAvatar(
              radius: 10.r,
              backgroundColor: SharedColor.mainColor,
              child: const Icon(
                Icons.add,
                color: SharedColor.whiteColor,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          customText(
            text: "$quantity",
            color: Colors.black,
            fontSize: getResponsiveFont(context, fontSize: 15),
          ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            onTap: decrement,
            child: CircleAvatar(
              radius: 10.r,
              backgroundColor: SharedColor.mainColor,
              child: const Icon(
                Icons.remove,
                color: SharedColor.whiteColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
