import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageIcon(
          const AssetImage("lib/core/assestes/facebook.png"),
          size: getResponsiveFont(context, fontSize: 50),
          color: SharedColor.mainColor,
        ),
        SizedBox(
          width: 20.h,
        ),
        ImageIcon(
          const AssetImage("lib/core/assestes/twitter.png"),
          size: getResponsiveFont(context, fontSize: 50),
          color: SharedColor.mainColor,
        ),
        SizedBox(
          width: 20.h,
        ),
        ImageIcon(
          const AssetImage("lib/core/assestes/youtube.png"),
          size: getResponsiveFont(context, fontSize: 50),
          color: SharedColor.mainColor,
        ),
      ],
    );
  }
}
