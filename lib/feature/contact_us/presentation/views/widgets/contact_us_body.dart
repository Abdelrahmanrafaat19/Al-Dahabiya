import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/contact_us/presentation/bloc/contact_us_cubit.dart';
import 'package:secondwork/feature/contact_us/presentation/bloc/contact_us_state.dart';
import 'package:secondwork/feature/contact_us/presentation/views/widgets/email_field.dart';
import 'package:secondwork/feature/contact_us/presentation/views/widgets/email_phone_column.dart';
import 'package:secondwork/feature/contact_us/presentation/views/widgets/message_field.dart';
import 'package:secondwork/feature/contact_us/presentation/views/widgets/phone_field.dart';
import 'package:secondwork/feature/contact_us/presentation/views/widgets/send_button.dart';
import 'package:secondwork/feature/contact_us/presentation/views/widgets/social_media_icons.dart';
import 'package:secondwork/feature/contact_us/presentation/views/widgets/user_name_field.dart';

class ContatctUsBody extends StatelessWidget {
  ContatctUsBody({super.key});
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsCubit, ContactUsState>(
        listener: (context, state) {
      if (state is ContactUsIsLoadingState) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
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
      } else if (state is ContactUsSuccessState) {
        Navigator.of(context).pop();
        if (state.data["code"] == 200) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(state.data["message"].toString()),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(state.data["message"].toString()),
            ),
          );
        }
      } else if (state is ContactUsFailureState) {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(state.message.toString()),
          ),
        );
      }
    }, builder: (context, state) {
      return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: responsiveWeidth(context, 15),
            ),
            alignment: Alignment.center,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                const EmailAndPhoneColumn(),
                SizedBox(
                  height: 30.h,
                ),
                const SocialMediaIcon(),
                SizedBox(
                  height: 30.h,
                ),
                UserNameFieldContatct(
                  controller: nameController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                PhoneNumberFieldContact(
                  controller: phoneNumberController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                EmailFieldContact(
                  controller: emailController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                MessageField(
                  controller: messageController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                SendButton(
                  ontap: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<ContactUsCubit>(context).contactUsMethod({
                        "name": nameController.text,
                        "email": emailController.text,
                        "phone": phoneNumberController.text,
                        "message": messageController.text
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
