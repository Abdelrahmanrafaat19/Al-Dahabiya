import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

class SendEmailButton extends StatefulWidget {
  const SendEmailButton({super.key});

  @override
  State<SendEmailButton> createState() => _SendEmailButtonState();
}

class _SendEmailButtonState extends State<SendEmailButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45.w),
      child: defaultButton(
        text: S.of(context).send,
        textcolor: SharedColor.whiteColor,
        fontSize: 20.w,
        color: SharedColor.orangeColor,
        paddingrl: 20.w,
        paddingtb: 10.h,
        onTap: () {},
      ),
    );
  }
}
