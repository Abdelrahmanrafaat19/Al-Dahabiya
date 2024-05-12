import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/login/presentation/view/widget/login_container.dart';
import 'package:secondwork/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigh = MediaQuery.of(context).size.height;
    return Scaffold(
      /*    appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () async {
            if (Intl.getCurrentLocale() == "ar") {
              BlocProvider.of<LocaleCubit>(context).changeLanguage("en");
            } else {
              BlocProvider.of<LocaleCubit>(context).changeLanguage("ar");
            }
            setState(() {});
          },
          child: const Text('قم بتسجيل الدخول مجددا'),
        ),
      ), */
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
                text: S.of(context).loginTitle,
                fontSize: width < heigh ? 20.w : 20.h,
                fontWeight: FontWeight.w700,
              ),
              customText(
                color: SharedColor.greyColor,
                text: S.of(context).loginSubTitle,
                fontSize: width < heigh ? 15.w : 15.h,
              ),
              SizedBox(
                height: width < heigh ? 70.h : 70.w,
              ),
              const LoginContainer()
            ],
          ),
        ),
      ),
    );
  }
}
