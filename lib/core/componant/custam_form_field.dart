import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/theme/color.dart';

Container defaultTextFormField({
  @required Widget? label,
  double? fontSize,
  String? name,
  TextEditingController? controller,
  TextInputType? keyboardType,
  bool obscure = false,
  bool read = false,
  String? value,
  Function? onchang,
  required TextStyle style,
  double? marginrl = 30,
  Widget? suffixIcon,
  String? hint,
  InputBorder? border,
  String? Function(String?)? validator,
  double? height,
}) {
  return Container(
    height: height,
    margin: EdgeInsets.only(right: marginrl!, left: marginrl),
    child: TextFormField(
      validator: validator,
      onChanged: (value) => name = value,
      controller: controller,
      style: TextStyle(fontSize: fontSize, color: Colors.grey),
      obscureText: obscure,
      initialValue: value,
      readOnly: read,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: local == "en" ? 18 : 18, horizontal: 10),
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xffB8B8B8)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: suffixIcon,
        label: label,
        enabledBorder: border,
        focusedBorder: border,
        border: border,
        errorBorder: border!.copyWith(
            borderSide: BorderSide(
          color: SharedColor.mainColor,
          width: 2.w,
        )),
      ),
      keyboardType: keyboardType,
    ),
  );
}
