import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../core/scal_factor_method.dart';
import '../../../../../generated/l10n.dart';

class EditAddressField extends StatefulWidget {
  final TextEditingController controller;
  const EditAddressField({super.key, required this.controller});

  @override
  State<EditAddressField> createState() => _EditAddressFieldState();
}

class _EditAddressFieldState extends State<EditAddressField> {
  @override
  Widget build(BuildContext context) {
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).addresserrorfield;
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
              Icons.add_location,
              color: SharedColor.greyFieldColor,
              size: getResponsiveFont(context, fontSize: 25),
            ),
            customText(
                fontWeight: FontWeight.w600,
                text: S.of(context).address,
                color: SharedColor.greyFieldColor,
                fontSize: getResponsiveFont(context, fontSize: 15))
          ],
        ),
        hint: S.of(context).addressHint,
        style: const TextStyle());
  }
}
