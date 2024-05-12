import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

// ignore: must_be_immutable
class SignUpButton extends StatefulWidget {
  Function onTap;
  SignUpButton({super.key, required this.onTap});

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45.w),
      child: defaultButton(
        text: S.of(context).signup,
        textcolor: SharedColor.whiteColor,
        fontSize: 20.w,
        color: SharedColor.orangeColor,
        paddingrl: 20.w,
        paddingtb: 10.h,
        onTap: widget.onTap,
      ),
    );
  }
}
