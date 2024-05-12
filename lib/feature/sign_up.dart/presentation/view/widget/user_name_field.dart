import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_form_field.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

// ignore: must_be_immutable
class UserNameField extends StatefulWidget {
  TextEditingController userNameController;
  UserNameField({super.key, required this.userNameController});

  @override
  State<UserNameField> createState() => _UserNameFieldState();
}

class _UserNameFieldState extends State<UserNameField> {
  @override
  Widget build(BuildContext context) {
    return defaultTextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).usernameerrorfield;
          }

          return null;
        },
        controller: widget.userNameController,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide:
                BorderSide(color: SharedColor.greyFieldColor, width: 2.w)),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person,
              color: SharedColor.greyFieldColor,
              size: 25.w,
            ),
            customText(
                fontWeight: FontWeight.w600,
                text: S.of(context).userName,
                color: SharedColor.greyFieldColor,
                fontSize: 15.w)
          ],
        ),
        hint: S.of(context).usernameHint,
        style: const TextStyle());
  }
}
