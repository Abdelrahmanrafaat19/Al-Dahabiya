import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';
import 'package:secondwork/generated/l10n.dart';
import 'package:secondwork/main.dart';

class SignUpQus extends StatefulWidget {
  const SignUpQus({super.key});

  @override
  State<SignUpQus> createState() => _SignUpQusState();
}

class _SignUpQusState extends State<SignUpQus> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customText(
          text: S.of(context).signUpQ,
          color: Colors.black,
          fontSize: isArabic() ? 19.w : 13.w,
          fontWeight: FontWeight.w500,
        ),
        textButton(
            text: customText(
              text: S.of(context).signin,
              color: SharedColor.blueColor,
              fontSize: isArabic() ? 15.w : 12.w,
              fontWeight: FontWeight.w500,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false);
            })
      ],
    );
  }
}
