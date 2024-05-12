import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../core/scal_factor_method.dart';
import '../../../../../generated/l10n.dart';

class PromoCodeField extends StatefulWidget {
  final TextEditingController controller;
  const PromoCodeField({super.key, required this.controller});

  @override
  State<PromoCodeField> createState() => _PromoCodeFieldState();
}

class _PromoCodeFieldState extends State<PromoCodeField> {
  @override
  Widget build(BuildContext context) {
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).usernameerrorfield;
          }

          return null;
        },
        // controller: widget.userNameController,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
                color: SharedColor.greyFieldColor,
                width: responsiveWeidth(context, 2))),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            customText(
                fontWeight: FontWeight.w600,
                text: S.of(context).promocode,
                color: SharedColor.greyFieldColor,
                fontSize: getResponsiveFont(context, fontSize: 15))
          ],
        ),
        controller: widget.controller,
        hint: S.of(context).promocode,
        style: const TextStyle());
  }
}
