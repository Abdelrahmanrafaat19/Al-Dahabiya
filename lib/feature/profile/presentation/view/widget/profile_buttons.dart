import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';

// ignore: must_be_immutable
class ProfilrButtons extends StatelessWidget {
  final IconData leftIcon, reightIcon;
  final String text;
  void Function()? onTap;
  ProfilrButtons(
      {super.key,
      required this.leftIcon,
      required this.reightIcon,
      required this.text,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: Colors.black,
            width: responsiveWeidth(context, 2),
          ),
        ),
        child: Row(
          children: [
            Icon(
              leftIcon,
              color: SharedColor.mainColor,
              size: getResponsiveFont(context, fontSize: 30),
            ),
            SizedBox(
              width: responsiveWeidth(context, 10),
            ),
            Expanded(
              child: customText(
                color: Colors.black,
                text: text,
                fontSize: getResponsiveFont(context, fontSize: 17),
                fontWeight: FontWeight.w900,
              ),
            ),
            Icon(
              reightIcon,
              color: SharedColor.mainColor,
              size: getResponsiveFont(context, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
