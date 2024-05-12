import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

class AddToCartButton extends StatelessWidget {
  final void Function()? onTap;
  const AddToCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: 200.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: SharedColor.mainColor,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: customText(
              text: S.of(context).addtocart,
              color: SharedColor.whiteColor,
              fontSize: 20.w,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
