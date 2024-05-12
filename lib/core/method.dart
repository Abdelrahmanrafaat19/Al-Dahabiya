import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double responsiveHieght(BuildContext context, double sizeOfHeight) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return width < height ? sizeOfHeight.h : sizeOfHeight.w;
}

double responsiveWeidth(BuildContext context, double sizeOfWiedth) {
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return width > height ? sizeOfWiedth.h : sizeOfWiedth.w;
}
