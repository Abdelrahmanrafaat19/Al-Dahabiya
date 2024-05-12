import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';
import 'widget/sign_up_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColor.mainColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 100.h),
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText(
                color: SharedColor.whiteColor,
                text: S.of(context).signuptitle,
                fontSize: 20.w,
                fontWeight: FontWeight.w700,
              ),
              customText(
                color: SharedColor.greyColor,
                text: S.of(context).signupsubtitle,
                fontSize: 15.w,
              ),
              SizedBox(
                height: 70.h,
              ),
              const SignUpContatiner()
            ],
          ),
        ),
      ),
    );
  }
}
