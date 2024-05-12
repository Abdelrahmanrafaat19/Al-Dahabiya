import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

// ignore: must_be_immutable
class PasswordFieldLoginScreen extends StatefulWidget {
  TextEditingController passwordController;
  PasswordFieldLoginScreen({super.key, required this.passwordController});

  @override
  State<PasswordFieldLoginScreen> createState() =>
      _PasswordFieldLoginScreenState();
}

class _PasswordFieldLoginScreenState extends State<PasswordFieldLoginScreen> {
  bool passobsure = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigh = MediaQuery.of(context).size.height;
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).passworderrorfield;
          }

          return null;
        },
        controller: widget.passwordController,
        obscure: passobsure,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
                color: SharedColor.greyFieldColor,
                width: width < heigh ? 2.w : 2.h)),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.phone_android,
              color: SharedColor.greyFieldColor,
              size: width < heigh ? 25.w : 25.h,
            ),
            customText(
                fontWeight: FontWeight.w600,
                text: S.of(context).password,
                color: SharedColor.greyFieldColor,
                fontSize: width < heigh ? 15.w : 15.h)
          ],
        ),
        hint: S.of(context).passwordHint,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              highlightColor: const Color(0xffF8F8F8),
              splashColor: const Color(0xffF8F8F8),
              child: Icon(
                passobsure ? Icons.visibility_off : Icons.visibility,
                color: SharedColor.greyFieldColor,
              ),
              onTap: () {
                setState(() {
                  passobsure = !passobsure;
                });
              },
            ),
            textButton(
                text: customText(
                  text: S.of(context).forget,
                  color: SharedColor.blueColor,
                  fontSize: width < heigh ? 12.w : 12.h,
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () {})
          ],
        ),
        style: const TextStyle());
  }
}
