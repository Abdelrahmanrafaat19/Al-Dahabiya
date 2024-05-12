import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

List<String> time = ["7PM-12PM", "12PM-4PM", "4PM-9PM", "9PM-12PM"];

class DeliveryTimeField extends StatefulWidget {
  final SingleValueDropDownController controller;
  const DeliveryTimeField({super.key, required this.controller});

  @override
  State<DeliveryTimeField> createState() => _DeliveryTimeFieldState();
}

class _DeliveryTimeFieldState extends State<DeliveryTimeField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWeidth(context, 20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          customText(
            color: SharedColor.greyFieldColor,
            text: S.of(context).deliverytime,
            fontSize: getResponsiveFont(context, fontSize: 15),
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            width: responsiveWeidth(context, 10),
          ),
          Expanded(
            child: SizedBox(
              height: 45.h,
              child: DropDownTextField(
                listTextStyle: const TextStyle(
                  decorationColor: SharedColor.whiteColor,
                ),
                searchDecoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: SharedColor.greyFieldColor,
                      width: responsiveWeidth(context, 2),
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  icon: const Icon(Icons.arrow_drop_down),
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  hintText: S.of(context).choose,
                  hintStyle: const TextStyle(color: SharedColor.greyFieldColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: SharedColor.greyFieldColor,
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),

                textFieldDecoration: InputDecoration(
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  hintText: S.of(context).choose,
                  hintStyle: const TextStyle(color: SharedColor.greyFieldColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: SharedColor.greyFieldColor,
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                // initialValue: "مندوب/تاجر",
                controller: widget.controller,
                clearOption: true,
                // enableSearch: true,
                dropdownColor: SharedColor.greyFieldColor,

                dropDownItemCount: time.length,

                dropDownList: [
                  for (int i = 0; i < time.length; i++)
                    DropDownValueModel(
                      name: time[i],
                      value: time[i],
                    ),
                ],
                onChanged: (val) {
                  print(val);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
