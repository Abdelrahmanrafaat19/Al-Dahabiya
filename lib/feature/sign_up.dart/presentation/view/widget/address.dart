import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

// ignore: must_be_immutable
class AddressField extends StatefulWidget {
  TextEditingController addressController;
  AddressField({super.key, required this.addressController});

  @override
  State<AddressField> createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  @override
  Widget build(BuildContext context) {
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).addresserrorfield;
          }

          return null;
        },
        controller: widget.addressController,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: SharedColor.greyFieldColor, width: 2.w),
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add_location,
              color: SharedColor.greyFieldColor,
              size: 25.w,
            ),
            customText(
                fontWeight: FontWeight.w600,
                text: S.of(context).address,
                color: SharedColor.greyFieldColor,
                fontSize: 15.w)
          ],
        ),
        hint: S.of(context).addressHint,
        style: const TextStyle());
  }
}
