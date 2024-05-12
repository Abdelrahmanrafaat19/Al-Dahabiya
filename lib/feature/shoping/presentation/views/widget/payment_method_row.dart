import 'package:flutter/material.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../core/scal_factor_method.dart';
import '../../../../../generated/l10n.dart';

class PaymentMethodRow extends StatelessWidget {
  const PaymentMethodRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: customText(
            text: "${S.of(context).paymentmethod} :",
            color: Colors.black,
            fontSize: getResponsiveFont(context, fontSize: 20),
            fontWeight: FontWeight.bold,
          ),
        ),
        Flexible(
          child: customText(
            text: S.of(context).whenpayment,
            color: SharedColor.orangeColor,
            fontSize: getResponsiveFont(context, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
