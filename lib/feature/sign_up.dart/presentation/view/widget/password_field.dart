import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  TextEditingController controller;
  PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passobsure = true;
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
        obscure: passobsure,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide:
                BorderSide(color: SharedColor.greyFieldColor, width: 2.w)),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.lock,
              color: SharedColor.greyFieldColor,
              size: 25.w,
            ),
            customText(
                fontWeight: FontWeight.w600,
                text: S.of(context).password,
                color: SharedColor.greyFieldColor,
                fontSize: 15.w)
          ],
        ),
        hint: S.of(context).passwordHint,
        suffixIcon: InkWell(
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
        style: const TextStyle());
  }
}
