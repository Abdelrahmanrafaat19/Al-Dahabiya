import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

class PhoneFieldLoginScreen extends StatelessWidget {
  final TextEditingController phoneNumberController;
  const PhoneFieldLoginScreen({super.key, required this.phoneNumberController});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigh = MediaQuery.of(context).size.height;
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).phonenumbererrorfield;
          }
          // You can add more complex validation here, like checking if the email follows a specific pattern
          // For simplicity, this example just checks if the field is not empty
          return null;
        },
        controller: phoneNumberController,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
                color: SharedColor.greyFieldColor,
                width: width < heigh ? 2.w : 3.h)),
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
                text: S.of(context).phone,
                color: SharedColor.greyFieldColor,
                fontSize: width < heigh ? 15.w : 15.h)
          ],
        ),
        hint: S.of(context).phoneHint,
        style: const TextStyle());
  }
}
