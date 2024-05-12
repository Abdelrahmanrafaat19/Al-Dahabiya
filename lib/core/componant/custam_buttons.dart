import 'package:flutter/material.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';

Widget defaultButton(
    {String text = "",
    double fontSize = 0.0,
    Color? color = SharedColor.whiteColor,
    Color textcolor = SharedColor.whiteColor,
    var onTap,
    double paddingrl = 0.0,
    double paddingtb = 0.0}) {
  return InkWell(
    highlightColor: const Color(0xffF8F8F8),
    splashColor: const Color(0xffF8F8F8),
    onTap: onTap,
    child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: color,
        ),
        padding:
            EdgeInsets.symmetric(vertical: paddingtb, horizontal: paddingrl),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: customText(
              text: text,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textcolor),
        )),
  );
}

Widget textButton({var onPressed, required Widget text}) {
  return TextButton(onPressed: onPressed, child: text);
}
