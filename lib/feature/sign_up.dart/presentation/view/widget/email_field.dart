import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

// ignore: must_be_immutable
class EmailField extends StatefulWidget {
  TextEditingController controller;
  EmailField({super.key, required this.controller});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).emailerrorfield;
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
              Icons.email,
              color: SharedColor.greyFieldColor,
              size: 25.w,
            ),
            customText(
                fontWeight: FontWeight.w600,
                text: S.of(context).email,
                color: SharedColor.greyFieldColor,
                fontSize: 15.w)
          ],
        ),
        hint: S.of(context).emailHint,
        style: const TextStyle());
  }
}
