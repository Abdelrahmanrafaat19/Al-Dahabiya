import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

// ignore: must_be_immutable
class DataColumnCart extends StatelessWidget {
  String name;
  dynamic price;
  DataColumnCart({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customText(
            text: name,
            color: Colors.black,
            fontSize: getResponsiveFont(context, fontSize: 15),
          ),
          SizedBox(
            height: 5.h,
          ),
          customText(
            text: "570 gm",
            color: Colors.black,
            fontSize: getResponsiveFont(context, fontSize: 15),
          ),
          customText(
            text: "$price ${S.of(context).EG}",
            color: SharedColor.mainColor,
            fontSize: getResponsiveFont(context, fontSize: 20),
            fontWeight: FontWeight.w800,
          ),
        ],
      ),
    );
  }
}
