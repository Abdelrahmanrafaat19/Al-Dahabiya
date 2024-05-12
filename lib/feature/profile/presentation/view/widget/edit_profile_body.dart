import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/change_address_container.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/change_phone_contatiner.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/change_username_container.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/profile_buttons.dart';
import 'package:secondwork/generated/l10n.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  bool visibleUsename = false;
  bool visiblePhone = false;
  bool visibleAddress = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            ProfilrButtons(
              onTap: () => setState(() {
                visibleUsename = !visibleUsename;
              }),
              leftIcon: Icons.edit,
              reightIcon: visibleUsename == false
                  ? Icons.arrow_right_sharp
                  : Icons.arrow_drop_down,
              text: S.of(context).userName,
            ),
            ChangeUserNameContainer(
              x: visibleUsename,
            ),
            SizedBox(
              height: 20.h,
            ),
            ProfilrButtons(
              onTap: () => setState(() {
                visiblePhone = !visiblePhone;
              }),
              leftIcon: Icons.phone_android_outlined,
              reightIcon: visiblePhone == false
                  ? Icons.arrow_right_sharp
                  : Icons.arrow_drop_down,
              text: S.of(context).phone,
            ),
            ChangePhoneContainer(
              x: visiblePhone,
            ),
            SizedBox(
              height: 20.h,
            ),
            ProfilrButtons(
              onTap: () => setState(() {
                visibleAddress = !visibleAddress;
              }),
              leftIcon: Icons.location_on_outlined,
              reightIcon: visibleAddress == false
                  ? Icons.arrow_right_sharp
                  : Icons.arrow_drop_down,
              text: S.of(context).address,
            ),
            AddAddressContatiner(x: visibleAddress),
          ],
        ),
      ),
    );
  }
}
