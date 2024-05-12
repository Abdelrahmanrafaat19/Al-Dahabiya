import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_username_bloc/change_username_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_username_bloc/change_username_state.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/first_name_field.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/save_button.dart';
import 'package:secondwork/generated/l10n.dart';

import 'last_name_field.dart';

class ChangeUserNameContainer extends StatefulWidget {
  final bool x;
  const ChangeUserNameContainer({super.key, required this.x});

  @override
  State<ChangeUserNameContainer> createState() =>
      _ChangeUserNameContainerState();
}

class _ChangeUserNameContainerState extends State<ChangeUserNameContainer> {
  TextEditingController firstUserNameController = TextEditingController();
  TextEditingController secondUserNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeUserNameCubit, ChangeUserNameState>(
        listener: (context, state) {
      if (state is ChangeUserNameIsLoadingState) {
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
      } else if (state is ChangeUserNameSuccessState) {
        Navigator.of(context).pop();

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
              "Done!",
              style: TextStyle(
                color: SharedColor.mainColor,
                fontSize: 20.w,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
        firstUserNameController.text = "";
        secondUserNameController.text = "";
      } else if (state is ChangeUserNameFailureState) {
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
              FirstNameField(
                controller: firstUserNameController,
              ),
              SizedBox(
                height: 20.h,
              ),
              LastNameField(
                controller: secondUserNameController,
              ),
              SizedBox(
                height: 20.h,
              ),
              SaveButton(
                ontap: () {
                  BlocProvider.of<ChangeUserNameCubit>(context)
                      .changeUserNameMethod({
                    "first_name": firstUserNameController.text,
                    "last_name": secondUserNameController.text,
                  });
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
