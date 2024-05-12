import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';
import 'widgets/send_email_container.dart';

class SendEmailScreen extends StatefulWidget {
  const SendEmailScreen({super.key});

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
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
                text: S.of(context).resetpassword,
                fontSize: 35.w,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 70.h,
              ),
              const SendEmailContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
