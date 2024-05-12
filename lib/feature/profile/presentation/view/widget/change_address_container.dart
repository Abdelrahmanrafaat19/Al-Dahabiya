import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';
import 'package:secondwork/feature/profile/presentation/bloc/add_address_bloc/add_address_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/add_address_bloc/add_address_state.dart';
import 'package:secondwork/feature/profile/presentation/bloc/user_address_bloc/user_address_cubit.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/edit_address_field.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/edit_city_row.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/edit_government_row.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/edit_zone_row.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/save_button.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/user_address_list.dart';

import '../../../../../generated/l10n.dart';

class AddAddressContatiner extends StatefulWidget {
  final bool x;
  const AddAddressContatiner({super.key, required this.x});

  @override
  State<AddAddressContatiner> createState() => _AddAddressContatinerState();
}

class _AddAddressContatinerState extends State<AddAddressContatiner> {
  SingleValueDropDownController governmentController =
      SingleValueDropDownController();
  SingleValueDropDownController cityController =
      SingleValueDropDownController();
  SingleValueDropDownController zoneController =
      SingleValueDropDownController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAddressCubit, AddAddressState>(
      listener: (context, state) {
        if (state is AddAddressIsLoadingState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              // ignore: sort_child_properties_last
              content: SizedBox(
                width: 50.w,
                height: 50.h,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: SharedColor.mainColor,
                )),
              ),
            ),
          );
        } else if (state is AddAddressSuccessState) {
          Navigator.of(context).pop();

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                state.data["message"],
                style: TextStyle(
                  color: SharedColor.mainColor,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        } else if (state is AddAddressFailureState) {
          if (state.message == 401) {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  children: [
                    Text(
                      S.of(context).loginagain,
                      style: TextStyle(
                        color: SharedColor.mainColor,
                        fontSize: 20.w,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    defaultButton(
                        text: S.of(context).loginagain,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                        })
                  ],
                ),
              ),
            );
          } else {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(state.message.toString()),
              ),
            );
          }
        }
      },
      builder: (context, state) {
        return Visibility(
          visible: widget.x,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.symmetric(vertical: 15.h),
            decoration: BoxDecoration(
              color: SharedColor.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6), // Set the shadow color
                  spreadRadius: 3, // Set how far the shadow spreads
                  blurRadius: 7, // Set the blur radius
                  offset: const Offset(0, 5), // Set the offset of the shadow
                ),
              ],
            ),
            width: double.infinity,
            child: Column(
              children: [
                const UserAddressList(),
                SizedBox(
                  height: 20.h,
                ),
                EditGovernmentRow(
                  controller: governmentController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                EditCityRow(
                  controller: cityController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                EditZoneRow(
                  controller: zoneController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                EditAddressField(
                  controller: addressController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SaveButton(
                  ontap: () async {
                    await BlocProvider.of<AddAddressCubit>(context)
                        .addAddressMethod(
                      {
                        "government_id":
                            governmentController.dropDownValue!.value,
                        "city_id": cityController.dropDownValue!.value,
                        "zone_id": zoneController.dropDownValue!.value,
                        "address": addressController.text,
                      },
                    );
                    // ignore: use_build_context_synchronously
                    await BlocProvider.of<UserAddressCubit>(context)
                        .getUserAddressMethod();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
