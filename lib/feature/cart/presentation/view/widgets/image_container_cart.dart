import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';

class ImageContainerCart extends StatelessWidget {
  final String? image;
  const ImageContainerCart({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveWeidth(context, 120),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: SharedColor.whiteColor,
        /* image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("lib/core/assestes/R.jpeg"),
        ), */
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
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
    );
  }
}
