import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

class SaveButton extends StatefulWidget {
  final Function? ontap;
  const SaveButton({super.key, this.ontap});

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsiveWeidth(context, 45)),
      child: defaultButton(
        text: S.of(context).save,
        textcolor: SharedColor.whiteColor,
        fontSize: getResponsiveFont(context, fontSize: 20),
        color: SharedColor.mainColor,
        paddingrl: responsiveWeidth(context, 20),
        paddingtb: 10.h,
        onTap: widget.ontap,
      ),
    );
  }
}
