import 'package:flutter/material.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';

import '../../../../../core/scal_factor_method.dart';
import '../../../../../core/theme/color.dart';
import '../../../../../generated/l10n.dart';

// ignore: must_be_immutable
class QuantityShoppinRow extends StatelessWidget {
  void Function()? decrementFunc, incrementfun;
  dynamic quatity, price;

  QuantityShoppinRow({
    super.key,
    required this.quatity,
    required this.decrementFunc,
    required this.incrementfun,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: responsiveWeidth(context, 10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              InkWell(
                onTap: incrementfun,
                child: CircleAvatar(
                  backgroundColor: SharedColor.mainColor,
                  child: Icon(
                    Icons.add,
                    size: getResponsiveFont(context, fontSize: 20),
                    color: SharedColor.whiteColor,
                  ),
                ),
              ),
              SizedBox(
                width: responsiveWeidth(context, 5),
              ),
              customText(
                text: "$quatity",
                color: Colors.black,
                fontSize: getResponsiveFont(context, fontSize: 20),
              ),
              SizedBox(
                width: responsiveWeidth(context, 5),
              ),
              InkWell(
                onTap: decrementFunc,
                child: CircleAvatar(
                  backgroundColor: SharedColor.mainColor,
                  child: Icon(
                    Icons.remove,
                    size: getResponsiveFont(context, fontSize: 20),
                    color: SharedColor.whiteColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: responsiveWeidth(context, 10),
          ),
          Expanded(
            child: customText(
              text: "$price ${S.of(context).EG}",
              color: Colors.black,
              fontSize: getResponsiveFont(context, fontSize: 20),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
