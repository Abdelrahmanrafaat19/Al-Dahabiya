import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_password_bloc/change_password_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/change_password_bloc/change_password_state.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/change_password_field.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/save_button.dart';
import 'package:secondwork/generated/l10n.dart';

class ChangePasswordBpdy extends StatefulWidget {
  const ChangePasswordBpdy({super.key});

  @override
  State<ChangePasswordBpdy> createState() => _ChangePasswordBpdyState();
}

class _ChangePasswordBpdyState extends State<ChangePasswordBpdy> {
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordIsLoadingState) {
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
        } else if (state is ChangePasswordSuccessState) {
          Navigator.of(context).pop();

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                "the password is Changed",
                style: TextStyle(
                  color: SharedColor.mainColor,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
          passwordController.text = "";
        } else if (state is ChangePasswordFailureState) {
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
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: responsiveWeidth(context, 15),
            ),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                ChangePasswordField(
                  controller: passwordController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SaveButton(
                  ontap: () {
                    BlocProvider.of<ChangePasswordCubit>(context)
                        .changePasswordMethod(
                            {"password": passwordController.text});
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
