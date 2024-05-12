import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';
import 'package:secondwork/feature/profile/presentation/bloc/user_profile_bloc/user_profile_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/user_profile_bloc/user_profile_state.dart';
import '../../../../generated/l10n.dart';
import 'widget/profile_container.dart';
import 'widget/username_row.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<UserProfileCubit>(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileSuccessState) {
          return Scaffold(
            backgroundColor: SharedColor.mainColor,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                alignment: Alignment.center,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    UserNameRow(
                      image: state.data.data!.phone ?? "",
                      name:
                          "${state.data.data!.firstName}${state.data.data!.lastName}",
                      email: state.data.data!.email ?? "",
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    ProfileContainer(
                      points: state.data.data!.points ?? "",
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is UserProfileIsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: SharedColor.mainColor,
            ),
          );
        } else if (state is UserProfileFailureState) {
          if (state.message == 401) {
            return TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              child: Text(S.of(context).loginagain),
            );
          } else {
            return Text("${state.message}");
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
