import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';

class ImageOfProduct extends StatelessWidget {
  final String image;
  const ImageOfProduct({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: local == "ar" ? responsiveWeidth(context, 20) : null,
      left: local == "en" ? responsiveWeidth(context, 20) : null,
      top: 40,
      child: SizedBox(
        width: responsiveWeidth(context, 100),
        height: 120,
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
      ),
    );
  }
}
