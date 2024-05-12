import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

import '../../../../../core/componant/custam_buttons.dart';

class LoginButton extends StatefulWidget {
  final void Function()? onTap;
  const LoginButton({super.key, required this.onTap});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigh = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width < heigh ? 45.w : 45.h),
      child: defaultButton(
        text: S.of(context).signin,
        textcolor: SharedColor.whiteColor,
        fontSize: width < heigh ? 20.w : 20.h,
        color: SharedColor.orangeColor,
        paddingtb: width < heigh ? 10.h : 10.w,
        onTap: widget.onTap,
      ),
    );
  }
}
