import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/view/sign_up.dart';
import 'package:secondwork/generated/l10n.dart';

class SignUpQLoginScreen extends StatelessWidget {
  const SignUpQLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customText(
          text: S.of(context).signinQ,
          color: Colors.black,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        textButton(
            text: customText(
              text: S.of(context).signup,
              color: SharedColor.blueColor,
              fontSize: 12.w,
              fontWeight: FontWeight.w500,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ));
            })
      ],
    );
  }
}
