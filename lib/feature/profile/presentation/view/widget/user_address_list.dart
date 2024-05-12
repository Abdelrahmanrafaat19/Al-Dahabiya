import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';
import 'package:secondwork/feature/profile/presentation/bloc/user_address_bloc/user_address_cubit.dart';
import 'package:secondwork/feature/profile/presentation/bloc/user_address_bloc/user_address_state.dart';
import 'package:secondwork/generated/l10n.dart';

class UserAddressList extends StatelessWidget {
  const UserAddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAddressCubit, UserAddressState>(
      builder: (context, state) {
        if (state is UserAddressSuccessState) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.data.data!.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.only(bottom: 5.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: responsiveWeidth(context, 5),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: Colors.black12,
                      width: responsiveWeidth(context, 5),
                    ),
                  ),
                  child: Text(
                    "${state.data.data![index].address}-${state.data.data![index].government}-${state.data.data![index].city}-${state.data.data![index].zone}",
                    style: TextStyle(
                        fontSize: getResponsiveFont(context, fontSize: 15)),
                  ));
            },
          );
        } else if (state is UserAddressIsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: SharedColor.mainColor,
            ),
          );
        } else if (state is UserAddressFailureState) {
          return SizedBox(
              child: Column(
            children: [
              Text(
                S.of(context).loginagain,
                style: TextStyle(
                  color: SharedColor.mainColor,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 45.w),
                child: defaultButton(
                  text: S.of(context).signin,
                  textcolor: SharedColor.whiteColor,
                  fontSize: 20.w,
                  color: SharedColor.orangeColor,
                  paddingrl: 20.w,
                  paddingtb: 10.h,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  },
                ),
              ),
            ],
          ));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
