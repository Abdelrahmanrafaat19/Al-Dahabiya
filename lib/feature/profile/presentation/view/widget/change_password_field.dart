import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

import '../../../../../core/scal_factor_method.dart';

class ChangePasswordField extends StatefulWidget {
  final TextEditingController controller;
  const ChangePasswordField({super.key, required this.controller});

  @override
  State<ChangePasswordField> createState() => _ChangePasswordFieldState();
}

class _ChangePasswordFieldState extends State<ChangePasswordField> {
  @override
  Widget build(BuildContext context) {
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).passworderrorfield;
          }

          return null;
        },
        controller: widget.controller,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
              color: SharedColor.greyFieldColor,
              width: responsiveWeidth(context, 2)),
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add_location,
              color: SharedColor.greyFieldColor,
              size: getResponsiveFont(context, fontSize: 25),
            ),
            customText(
              fontWeight: FontWeight.w600,
              text: S.of(context).changepassword,
              color: SharedColor.greyFieldColor,
              fontSize: getResponsiveFont(context, fontSize: 15),
            ),
          ],
        ),
        hint: S.of(context).passwordHint,
        style: const TextStyle());
  }
}
