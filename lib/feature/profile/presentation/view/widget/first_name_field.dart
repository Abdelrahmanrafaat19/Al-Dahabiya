import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

import '../../../../../core/scal_factor_method.dart';

class FirstNameField extends StatefulWidget {
  final TextEditingController controller;
  FirstNameField({super.key, required this.controller});

  @override
  State<FirstNameField> createState() => _FirstNameFieldState();
}

class _FirstNameFieldState extends State<FirstNameField> {
  @override
  Widget build(BuildContext context) {
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).usernameerrorfield;
          }

          return null;
        },
        controller: widget.controller,
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
              Icons.person,
              color: SharedColor.greyFieldColor,
              size: getResponsiveFont(context, fontSize: 25),
            ),
            customText(
                fontWeight: FontWeight.w600,
                text: S.of(context).firstname,
                color: SharedColor.greyFieldColor,
                fontSize: getResponsiveFont(context, fontSize: 15))
          ],
        ),
        hint: S.of(context).usernameHint,
        style: const TextStyle());
  }
}
