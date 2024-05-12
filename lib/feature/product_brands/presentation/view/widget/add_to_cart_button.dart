import 'package:flutter/material.dart';

import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../generated/l10n.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: responsiveWeidth(context, 10)),
      child: defaultButton(
        text: S.of(context).addtocart,
        textcolor: SharedColor.whiteColor,
        fontSize: getResponsiveFont(context, fontSize: 30),
        color: SharedColor.orangeColor,
        paddingrl: responsiveWeidth(context, 5),
      ),
    );
  }
}
