import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/theme/color.dart';

class SingleProductSlider extends StatelessWidget {
  final List<dynamic> image;
  const SingleProductSlider({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20.h),
      child: CarouselSlider.builder(
        itemCount: image.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            width: double.infinity,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6), // Set the shadow color
                  spreadRadius: 3, // Set how far the shadow spreads
                  blurRadius: 7, // Set the blur radius
                  offset: const Offset(0, 2), // Set the offset of the shadow
                ),
              ],
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: NetworkImage(
              //     "$baseUrl/images${image[index].image}",
              //   ),
              // ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: "$baseUrl/images${image[index].image}",
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: SharedColor.mainColor,
                )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          initialPage: 0,
        ),
      ),
    );
  }
}
