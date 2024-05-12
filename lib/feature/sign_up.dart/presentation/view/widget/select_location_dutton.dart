import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/generated/l10n.dart';

// ignore: must_be_immutable
class SelectLocationButton extends StatefulWidget {
  final Function onTap;
  bool togleColor;
  SelectLocationButton(
      {super.key, required this.onTap, required this.togleColor});

  @override
  State<SelectLocationButton> createState() => _SelectLocationButtonState();
}

class _SelectLocationButtonState extends State<SelectLocationButton> {
  Position? currentLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45.w),
      child: defaultButton(
        text: !widget.togleColor
            ? S.of(context).selectLocation
            : S.of(context).selectlocationcomplete,
        textcolor: SharedColor.whiteColor,
        fontSize: 20.w,
        color: !widget.togleColor ? SharedColor.mainColor : Colors.green,
        paddingrl: 20.w,
        paddingtb: 10.h,
        onTap: widget.onTap,
      ),
    );
  }
}
