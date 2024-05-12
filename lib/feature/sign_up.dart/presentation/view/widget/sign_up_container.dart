import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/sign_up_bloc/sign_up_cubit.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/bloc/sign_up_bloc/sign_up_state.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/view/widget/address.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/view/widget/city_field.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/view/widget/phone_number_field.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/view/widget/row_q.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/view/widget/select_location_dutton.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/view/widget/sign_up_button.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/view/widget/user_name_field.dart';
import 'package:secondwork/feature/sign_up.dart/presentation/view/widget/zone_field.dart';
import 'package:secondwork/generated/l10n.dart';

import 'email_field.dart';
import 'government_row.dart';
import 'password_field.dart';

class SignUpContatiner extends StatefulWidget {
  const SignUpContatiner({super.key});

  @override
  State<SignUpContatiner> createState() => _SignUpContatinerState();
}

class _SignUpContatinerState extends State<SignUpContatiner> {
  TextEditingController uaseNameController = TextEditingController();
  TextEditingController phoneNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  SingleValueDropDownController governmentController =
      SingleValueDropDownController();
  SingleValueDropDownController cityController =
      SingleValueDropDownController();
  SingleValueDropDownController zoneController =
      SingleValueDropDownController();
  Position? currentLocation;
  bool change = false;
  final _formKey = GlobalKey<FormState>();
  Future<void> _getCurrentLocation() async {
    try {
      bool locationPermission = await Geolocator.isLocationServiceEnabled();
      if (locationPermission) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          currentLocation = position;
          change = true;
          debugPrint(
              "Latitude: ${position.latitude}, Longitude: ${position.longitude}'");
        });
      } else {
        await Geolocator.openLocationSettings();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(
              bottom: 20.h,
              top: 30.h,
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: SharedColor.whiteColor,
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(color: Colors.black, width: 1.5.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserNameField(
                  userNameController: uaseNameController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                PhoneNumberField(
                  controller: phoneNameController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                EmailField(
                  controller: emailController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                PasswordField(
                  controller: passwordController,
                ),
                SizedBox(
                  height: 25.h,
                ),
                GovernmentRow(
                  controller: governmentController,
                ),
                SizedBox(
                  height: 25.h,
                ),
                CityField(
                  controller: cityController,
                ),
                SizedBox(
                  height: 25.h,
                ),
                ZoneField(
                  controller: zoneController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                AddressField(
                  addressController: addressController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                SelectLocationButton(
                  togleColor: change,
                  onTap: () async {
                    await _getCurrentLocation();
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                SignUpButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (currentLocation == null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text(S.of(context).selectlocationerror),
                          ),
                        );
                      } else {
                        BlocProvider.of<SignUpCubit>(context).signUpMethod({
                          "first_name": uaseNameController.text,
                          "email": emailController.text,
                          "password": passwordController.text,
                          "phone": phoneNameController.text,
                          "government_id": governmentController
                              .dropDownValue!.value
                              .toString(),
                          "city_id":
                              cityController.dropDownValue!.value.toString(),
                          "zone_id":
                              zoneController.dropDownValue!.value.toString(),
                          "address": addressController.text,
                          "lng": currentLocation!.longitude.toString(),
                          "lat": currentLocation!.latitude.toString()
                        });
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                const SignUpQus(),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SignUpIsLoadingState) {
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
        } else if (state is SignUpSuccessState) {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(S.of(context).signupsuccessatate),
            ),
          );
        } else {
          Navigator.of(context).pop();

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(S.of(context).signupfailurestate),
            ),
          );
        }
      },
    );
  }
}
