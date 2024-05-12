import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../core/scal_factor_method.dart';

// ignore: must_be_immutable
class DeletShoppingButton extends StatelessWidget {
  void Function()? deletfun;
  DeletShoppingButton({super.key, required this.deletfun});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: deletfun,
        child: CircleAvatar(
          radius: 15.r,
          backgroundColor: SharedColor.mainColor,
          child: Icon(
            Icons.delete,
            size: getResponsiveFont(
              context,
              fontSize: 20,
            ),
            color: SharedColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
