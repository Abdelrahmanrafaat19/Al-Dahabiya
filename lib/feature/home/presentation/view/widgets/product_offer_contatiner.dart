import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/home/presentation/view/widgets/add_tocart_button_offer.dart';

class OfferProductContainer extends StatelessWidget {
  final String name, image;
  final dynamic price, id;
  final dynamic discounPrice;
  final bool hasDiscount;

  const OfferProductContainer(
      {super.key,
      required this.image,
      required this.name,
      required this.price,
      required this.discounPrice,
      required this.hasDiscount,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              width: 150,
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
            height: 10,
          ),
          Expanded(
            flex: 2,
            child: customText(
              text: name,
              color: Colors.black,
              fontSize: responsiveWeidth(context, 20),
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
                      fontSize: responsiveWeidth(context, 15),
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
                fontSize: responsiveWeidth(context, 15),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          AddToCartButton(
            name: name,
            price: price,
            productPhoto: image,
            id: id,
          )
        ],
      ),
    );
  }
}
