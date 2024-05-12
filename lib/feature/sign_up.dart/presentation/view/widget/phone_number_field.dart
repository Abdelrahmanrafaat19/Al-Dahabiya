import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

import '../../../../../core/componant/custam_form_field.dart';

// ignore: must_be_immutable
class PhoneNumberField extends StatefulWidget {
  TextEditingController controller;
  PhoneNumberField({super.key, required this.controller});

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).phonenumbererrorfield;
          }

          return null;
        },
        controller: widget.controller,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide:
                BorderSide(color: SharedColor.greyFieldColor, width: 2.w)),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.phone_android,
              color: SharedColor.greyFieldColor,
              size: 25.w,
            ),
            customText(
                fontWeight: FontWeight.w600,
                text: S.of(context).phone,
                color: SharedColor.greyFieldColor,
                fontSize: 15.w)
          ],
        ),
        hint: S.of(context).phoneHint,
        style: const TextStyle());
  }
}
