import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_phone_bloc/change_phone_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_phone_bloc/change_phone_state.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/edit_phone_field.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/save_button.dart';
import 'package:secondwork/generated/l10n.dart';

class ChangePhoneContainer extends StatefulWidget {
  final bool x;
  const ChangePhoneContainer({super.key, required this.x});

  @override
  State<ChangePhoneContainer> createState() => _ChangePhoneContainerState();
}

class _ChangePhoneContainerState extends State<ChangePhoneContainer> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePhoneCubit, ChangePhoneState>(
        listener: (context, state) {
      if (state is ChangePhoneIsLoadingState) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            // ignore: sort_child_properties_last
            content: SizedBox(
              width: responsiveWeidth(context, 50),
              height: 50.h,
              child: const Center(
                  child: CircularProgressIndicator(
                color: SharedColor.mainColor,
              )),
            ),
          ),
        );
      } else if (state is ChangePhoneSuccessState) {
        Navigator.of(context).pop();
        if (state.data["code"] == 200) {
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
          phoneController.text = "";
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                phoneController.text.isEmpty
                    ? S.of(context).phoneerror1
                    : S.of(context).phoneerror2,
                style: TextStyle(
                  color: SharedColor.mainColor,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }
      } else if (state is ChangePhoneFailureState) {
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
                      fontSize: responsiveWeidth(context, 20),
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
            builder: (context) => const AlertDialog(
              content: Text("افحص جودة الانترنت"),
            ),
          );
        }
      }
    }, builder: (context, state) {
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
              EditPhoneField(
                controller: phoneController,
              ),
              SizedBox(
                height: 20.h,
              ),
              SaveButton(
                ontap: () {
                  BlocProvider.of<ChangePhoneCubit>(context).changePhoneMethod(
                      {"phone_number": phoneController.text});
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
