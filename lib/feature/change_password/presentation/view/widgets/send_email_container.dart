import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/change_password/presentation/view/widgets/email_feild.dart';
import 'package:secondwork/feature/change_password/presentation/view/widgets/send_button.dart';

class SendEmailContainer extends StatefulWidget {
  const SendEmailContainer({super.key});

  @override
  State<SendEmailContainer> createState() => _SendEmailContainerState();
}

class _SendEmailContainerState extends State<SendEmailContainer> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(
          bottom: 20.h,
          top: 30.h,
        ),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: SharedColor.whiteColor,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: Colors.black, width: 1.5.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            const EmailField(),
            SizedBox(
              height: 20.h,
            ),
            const SendEmailButton()
          ],
        ),
      ),
    );
  }
}
