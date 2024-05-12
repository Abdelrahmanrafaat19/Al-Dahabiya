import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/cart/presentation/view/widgets/data_column_cart.dart';
import 'package:secondwork/feature/cart/presentation/view/widgets/delet_button_cart.dart';
import 'package:secondwork/feature/cart/presentation/view/widgets/image_container_cart.dart';
import 'package:secondwork/feature/cart/presentation/view/widgets/quantity_column_cart.dart';

// ignore: must_be_immutable
class ProductContatinerCart extends StatelessWidget {
  String name, image;
  void Function()? increment, decrement, deletFun;
  dynamic quantity, price;
  ProductContatinerCart({
    super.key,
    required this.image,
    required this.quantity,
    required this.price,
    required this.name,
    required this.decrement,
    required this.increment,
    required this.deletFun,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 10.h, horizontal: responsiveWeidth(context, 10)),
      margin: EdgeInsets.only(
        top: 5.h,
        bottom: 5.h,
        left: responsiveWeidth(context, 10),
        right: responsiveWeidth(context, 10),
      ),
      decoration: BoxDecoration(
        color: SharedColor.whiteColor,
        borderRadius: BorderRadius.circular(
          20.r,
        ),
      ),
      height: 100.h,
      width: double.infinity,
      child: Row(
        children: [
          ImageContainerCart(
            image: image,
          ),
          SizedBox(
            width: responsiveWeidth(context, 10),
          ),
          DataColumnCart(
            name: name,
            price: price,
          ),
          QuantityColumnCart(
            increment: increment,
            decrement: decrement,
            quantity: quantity,
          ),
          DeletButtonCart(
            deletFun: deletFun,
          )
        ],
      ),
    );
  }
}
