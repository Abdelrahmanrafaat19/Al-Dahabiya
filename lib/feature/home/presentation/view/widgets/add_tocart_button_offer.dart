import 'package:flutter/material.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../generated/l10n.dart';

class AddToCartButton extends StatelessWidget {
  final Function? onTap;
  const AddToCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: defaultButton(
        text: S.of(context).addtocart,
        textcolor: SharedColor.whiteColor,
        fontSize: responsiveWeidth(context, 30),
        color: SharedColor.orangeColor,
        paddingrl: responsiveHieght(context, 5),
        paddingtb: responsiveWeidth(context, 5),
      ),
    );
  }
}
