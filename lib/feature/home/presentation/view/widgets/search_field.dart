import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 30.h,
      ),
      child: TextField(
        cursorColor: SharedColor.greyFieldColor,
        decoration: InputDecoration(
          hintText: S.of(context).search,
          hintStyle: TextStyle(
            color: SharedColor.greyFieldColor,
            fontSize: 15.w,
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: SharedColor.greyColor,
          suffixIcon: Icon(
            Icons.search_rounded,
            color: SharedColor.greyFieldColor,
            size: 30.w,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              width: 1.w,
              color: SharedColor.greyFieldColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              width: 1.w,
              color: SharedColor.greyFieldColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide(
              width: 1.w,
              color: SharedColor.greyFieldColor,
            ),
          ),
        ),
      ),
    );
  }
}
