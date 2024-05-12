import 'package:flutter/material.dart';
import 'package:secondwork/core/theme/color.dart';

// ignore: must_be_immutable
class DeletButtonCart extends StatelessWidget {
  void Function()? deletFun;
  DeletButtonCart({
    super.key,
    required this.deletFun,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: deletFun,
      child: const CircleAvatar(
        backgroundColor: SharedColor.mainColor,
        child: Icon(
          Icons.delete,
          color: SharedColor.whiteColor,
        ),
      ),
    );
  }
}
