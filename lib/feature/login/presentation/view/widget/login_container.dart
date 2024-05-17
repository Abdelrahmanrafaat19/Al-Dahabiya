import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:secondwork/core/theme/color.dart';

import 'package:secondwork/feature/layout/bottom_navigation_bar/presentation/views/bottom_bar_screen.dart';
import 'package:secondwork/feature/login/presentation/bloc/login_cubit.dart';
import 'package:secondwork/feature/login/presentation/bloc/login_state.dart';
import 'package:secondwork/feature/login/presentation/view/widget/login_button.dart';
import 'package:secondwork/feature/login/presentation/view/widget/login_row_q_signup.dart';
import 'package:secondwork/feature/login/presentation/view/widget/password_field_login.dart';
import 'package:secondwork/feature/login/presentation/view/widget/phone_field_login.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heigh = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: SharedColor.mainColor,
                  ))),
            ),
          );
        } else if (state is LoginSaccussState) {
          Navigator.of(context).pop();
          if (state.data["code"] == 200) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const BottomBarScreen(),
                ),
                (route) => false);
          } else if (state.data["code"] == 400) {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                content: Text("البريد الالكتروني او كلمة المرور غير صحيحة"),
              ),
            );
          }
        } else if (state is LoginFailureState) {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(state.massege.toString()),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(
              bottom: width < heigh ? 20.h : 20.w,
              top: width < heigh ? 30.h : 30.w,
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: SharedColor.whiteColor,
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(
                  color: Colors.black, width: width < heigh ? 1.5.w : 1.5.h),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhoneFieldLoginScreen(
                  phoneNumberController: phoneNumberController,
                ),
                SizedBox(
                  height: width < heigh ? 40.h : 40.w,
                ),
                PasswordFieldLoginScreen(
                  passwordController: passwordController,
                ),
                SizedBox(
                  height: width < heigh ? 40.h : 40.w,
                ),
                LoginButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).loginMethod({
                        "phone": phoneNumberController.text,
                        "password": passwordController.text
                      });
                    }
                  },
                ),
                SizedBox(
                  height: width < heigh ? 20.h : 20.w,
                ),
                const SignUpQLoginScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
