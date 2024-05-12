import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/city_bloc/city_cubit.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/government_bloc/government_cubit.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/government_bloc/government_state.dart';

import '../../../../../generated/l10n.dart';

class EditGovernmentRow extends StatefulWidget {
  final SingleValueDropDownController controller;
  const EditGovernmentRow({super.key, required this.controller});

  @override
  State<EditGovernmentRow> createState() => _EditGovernmentRowState();
}

class _EditGovernmentRowState extends State<EditGovernmentRow> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GovernmentCubit>(context).getGovernmentMethod();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GovernmentCubit, GovernmentState>(
      builder: (context, state) {
        if (state is GovernmentSuccessState) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: responsiveWeidth(context, 20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  color: SharedColor.greyFieldColor,
                  text: S.of(context).government,
                  fontSize: getResponsiveFont(context, fontSize: 15),
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  width: 10.w,
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
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        icon: const Icon(Icons.arrow_drop_down),
                        suffixIcon: const Icon(Icons.arrow_drop_down),
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
                        suffixIcon: const Icon(Icons.arrow_drop_down),
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

                      validator: (value) {
                        if (value == null) {
                          return S.of(context).governmenterrorfield;
                        } else {
                          return null;
                        }
                      },
                      dropDownItemCount: 6,

                      dropDownList: [
                        for (int i = 0;
                            i < state.governmentModel.data!.length;
                            i++)
                          DropDownValueModel(
                            name: state.governmentModel.data![i].name ?? "",
                            value: state.governmentModel.data![i].id ?? 0,
                          ),
                      ],
                      onChanged: (val) {
                        BlocProvider.of<CityCubit>(context)
                            .getCities(val.value);
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is GovernmentIsLoadingState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  color: SharedColor.greyFieldColor,
                  text: S.of(context).government,
                  fontSize: 15.w,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
