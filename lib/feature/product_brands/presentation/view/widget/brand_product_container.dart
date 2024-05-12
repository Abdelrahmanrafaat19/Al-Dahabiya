import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/method.dart';

import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/feature/product_brands/presentation/view/widget/add_to_cart_button.dart';

import '../../../../../core/theme/color.dart';

class BandProductContainer extends StatelessWidget {
  final String name, image;
  final dynamic price;
  final dynamic discounPrice;
  final bool hasDiscount;

  const BandProductContainer(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.discounPrice,
      required this.hasDiscount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.all(responsiveWeidth(context, 10)),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              width: responsiveWeidth(context, 150),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: "$baseUrl/images$image",
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    color: SharedColor.mainColor,
                  )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: customText(
              text: name,
              color: Colors.black,
              fontSize: getResponsiveFont(context, fontSize: 15),
            ),
          ),
          hasDiscount == true
              ? Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: customText(
                      textDecoration: TextDecoration.lineThrough,
                      text: price.toString(),
                      color: SharedColor.greyFieldColor,
                      fontSize: getResponsiveFont(context, fontSize: 15),
                    ),
                  ),
                )
              : const SizedBox(),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: customText(
                text: hasDiscount == true
                    ? discounPrice.toString()
                    : price.toString(),
                color: SharedColor.mainColor,
                fontSize: getResponsiveFont(context, fontSize: 15),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const AddToCartButton()
        ],
      ),
    );
  }
}
