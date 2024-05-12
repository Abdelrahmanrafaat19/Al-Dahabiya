import 'package:flutter/material.dart';

Widget customText(
    {required String text,
    required Color color,
    required double fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    TextDecoration? textDecoration,
    TextOverflow? overflow = TextOverflow.ellipsis}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        decoration: textDecoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily),
  );
}
