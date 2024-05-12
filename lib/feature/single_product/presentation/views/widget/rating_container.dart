import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';

import '../../../../../core/constant/constant.dart';

class RatingContatiner extends StatelessWidget {
  final dynamic name, rating;
  const RatingContatiner({super.key, required this.name, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: local == "ar" ? 20.w : null,
      right: local == "en" ? 20.w : null,
      top: 20.h,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
                text: name,
                color: SharedColor.whiteColor,
                fontSize: getResponsiveFont(context, fontSize: 20)),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: getResponsiveFont(context, fontSize: 25),
                  initialRating: rating.toDouble(),
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: getResponsiveFont(context, fontSize: 5),
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  width: 20.w,
                ),
                const Icon(
                  Icons.add_box_rounded,
                  color: Colors.amber,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
