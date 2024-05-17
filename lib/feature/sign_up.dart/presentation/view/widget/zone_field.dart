import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/zone_bloc/zone_cubit.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/zone_bloc/zone_state.dart';
import 'package:secondwork/generated/l10n.dart';

class ZoneField extends StatefulWidget {
  final SingleValueDropDownController controller;
  const ZoneField({super.key, required this.controller});

  @override
  State<ZoneField> createState() => _ZoneFieldState();
}

class _ZoneFieldState extends State<ZoneField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZoneCubit, ZoneState>(
      builder: (context, state) {
        if (state is ZoneSuccessState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  color: SharedColor.greyFieldColor,
                  text: S.of(context).zone,
                  fontSize: 15.w,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45.h,
                    child: DropDownTextField(
                      listTextStyle: const TextStyle(),

                      searchDecoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SharedColor.greyFieldColor,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        hintText: S.of(context).zone,
                        hintStyle:
                            const TextStyle(color: SharedColor.greyFieldColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SharedColor.greyFieldColor,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      textFieldDecoration: InputDecoration(
                        hintText: S.of(context).choose,
                        hintStyle:
                            const TextStyle(color: SharedColor.greyFieldColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SharedColor.greyFieldColor,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),

                      controller: widget.controller,
                      clearOption: true,

                      dropdownColor: SharedColor.greyFieldColor,

                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return S.of(context).zoneerrorfield;
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      dropDownItemCount: 6,

                      dropDownList: [
                        for (int i = 0; i < state.zoneModel.data!.length; i++)
                          DropDownValueModel(
                            name: state.zoneModel.data![i].name ?? "",
                            value: state.zoneModel.data![i].id ?? 0,
                          ),
                      ],
                      onChanged: (val) {},
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is ZoneIsLoadingState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  color: SharedColor.greyFieldColor,
                  text: S.of(context).zone,
                  fontSize: 15.w,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45.h,
                    child: DropDownTextField(
                      isEnabled: false,
                      searchDecoration: InputDecoration(
                        hintText: S.of(context).zone,
                        hintStyle:
                            const TextStyle(color: SharedColor.greyFieldColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SharedColor.greyFieldColor,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      textFieldDecoration: InputDecoration(
                        hintText: S.of(context).choose,
                        hintStyle:
                            const TextStyle(color: SharedColor.greyFieldColor),
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

                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return S.of(context).zoneerrorfield;
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      dropDownItemCount: 6,

                      dropDownList: const [],
                      onChanged: (val) {},
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  color: SharedColor.greyFieldColor,
                  text: S.of(context).zone,
                  fontSize: 15.w,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45.h,
                    child: DropDownTextField(
                      isEnabled: false,
                      searchDecoration: InputDecoration(
                        hintText: S.of(context).zone,
                        hintStyle:
                            const TextStyle(color: SharedColor.greyFieldColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SharedColor.greyFieldColor,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      textFieldDecoration: InputDecoration(
                        hintText: S.of(context).choose,
                        hintStyle:
                            const TextStyle(color: SharedColor.greyFieldColor),
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

                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return S.of(context).zoneerrorfield;
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      dropDownItemCount: 6,

                      dropDownList: const [],
                      onChanged: (val) {},
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
