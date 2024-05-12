import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../generated/l10n.dart';

class ConfirmOrderButton extends StatefulWidget {
  final Function ontap;
  const ConfirmOrderButton({super.key, required this.ontap});

  @override
  State<ConfirmOrderButton> createState() => _ConfirmOrderButtonState();
}

class _ConfirmOrderButtonState extends State<ConfirmOrderButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45.w),
      child: defaultButton(
        text: S.of(context).ordernow,
        textcolor: SharedColor.whiteColor,
        fontSize: getResponsiveFont(context, fontSize: 20),
        color: SharedColor.orangeColor,
        paddingrl: responsiveWeidth(
          context,
          20,
        ),
        paddingtb: 10.h,
        onTap: widget.ontap,
      ),
    );
  }
}
