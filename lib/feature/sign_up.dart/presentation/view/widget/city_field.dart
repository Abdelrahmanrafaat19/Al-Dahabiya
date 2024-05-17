import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/city_bloc/city_cubit.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/city_bloc/city_state.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/zone_bloc/zone_cubit.dart';
import 'package:secondwork/generated/l10n.dart';

// ignore: must_be_immutable
class CityField extends StatefulWidget {
  SingleValueDropDownController controller;
  CityField({super.key, required this.controller});

  @override
  State<CityField> createState() => _CityFieldState();
}

class _CityFieldState extends State<CityField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityState>(
      builder: (context, state) {
        if (state is CitySuccessState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  color: SharedColor.greyFieldColor,
                  text: S.of(context).city,
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
                      enableSearch: true,
                      listTextStyle: const TextStyle(),

                      searchDecoration: InputDecoration(
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
                      //     return S.of(context).cityerrorfield;
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      dropDownItemCount: 6,

                      dropDownList: [
                        for (int i = 0; i < state.cityModel.data!.length; i++)
                          DropDownValueModel(
                            name: state.cityModel.data![i].name ?? "",
                            value: state.cityModel.data![i].id ?? 0,
                          ),
                      ],
                      onChanged: (val) {
                        BlocProvider.of<ZoneCubit>(context)
                            .getZoneMethod(val.value);
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is CityIsLoadingState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  color: SharedColor.greyFieldColor,
                  text: S.of(context).city,
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
                      //     return S.of(context).cityerrorfield;
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
                  text: S.of(context).city,
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
                      //     return S.of(context).cityerrorfield;
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
