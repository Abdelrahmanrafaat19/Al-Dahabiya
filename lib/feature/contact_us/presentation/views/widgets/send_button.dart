import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

import '../../../../../core/scal_factor_method.dart';

class SendButton extends StatelessWidget {
  final Function? ontap;
  const SendButton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsiveWeidth(context, 45)),
      child: defaultButton(
        text: S.of(context).send,
        textcolor: SharedColor.whiteColor,
        fontSize: getResponsiveFont(context, fontSize: 20),
        color: SharedColor.orangeColor,
        paddingrl: responsiveWeidth(context, 20),
        paddingtb: 10.h,
        onTap: ontap,
      ),
    );
  }
}
