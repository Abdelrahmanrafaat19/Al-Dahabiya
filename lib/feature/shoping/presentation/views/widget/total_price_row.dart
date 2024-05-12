import 'package:flutter/material.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

import '../../../../../core/scal_factor_method.dart';

// ignore: must_be_immutable
class TotalPriceRow extends StatelessWidget {
  dynamic price;
  TotalPriceRow({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: customText(
            text: S.of(context).totle,
            color: Colors.black,
            fontSize: getResponsiveFont(context, fontSize: 25),
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: customText(
            text: "$price",
            color: SharedColor.orangeColor,
            fontSize: getResponsiveFont(context, fontSize: 25),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
