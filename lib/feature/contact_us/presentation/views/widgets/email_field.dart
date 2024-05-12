import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../core/scal_factor_method.dart';
import '../../../../../generated/l10n.dart';

class EmailFieldContact extends StatelessWidget {
  final TextEditingController controller;

  const EmailFieldContact({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).emailerrorfield;
          }

          return null;
        },
        controller: controller,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
            color: SharedColor.greyFieldColor,
            width: responsiveWeidth(context, 2),
          ),
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.email,
              color: SharedColor.greyFieldColor,
              size: getResponsiveFont(context, fontSize: 25),
            ),
            customText(
                fontWeight: FontWeight.w600,
                text: S.of(context).email,
                color: SharedColor.greyFieldColor,
                fontSize: getResponsiveFont(context, fontSize: 15))
          ],
        ),
        hint: S.of(context).emailHint,
        style: const TextStyle());
  }
}