import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/delet_shoping_button.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/quatity_shopping_row.dart';

// ignore: must_be_immutable
class ProductShoppingContainer extends StatelessWidget {
  void Function()? decrementFunc, incrementfun, deletFun;
  String name;
  dynamic quatity, price;
  ProductShoppingContainer({
    super.key,
    required this.quatity,
    required this.decrementFunc,
    required this.incrementfun,
    required this.deletFun,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: responsiveWeidth(context, 5),
      ),
      width: double.infinity,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: SharedColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6), // Set the shadow color
            spreadRadius: 3, // Set how far the shadow spreads
            blurRadius: 7, // Set the blur radius
            offset: const Offset(0, 1), // Set the offset of the shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(
                  text: name,
                  color: Colors.black,
                  fontSize: getResponsiveFont(context, fontSize: 20),
                  fontWeight: FontWeight.bold,
                ),
                QuantityShoppinRow(
                  price: price,
                  incrementfun: incrementfun,
                  decrementFunc: decrementFunc,
                  quatity: quatity,
                )
              ],
            ),
          ),
          Expanded(
            child: DeletShoppingButton(
              deletfun: deletFun,
            ),
          )
        ],
      ),
    );
  }
}
