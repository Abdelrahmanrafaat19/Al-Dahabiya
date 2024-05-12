import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/scal_factor_method.dart';

import 'package:secondwork/core/theme/color.dart';

import '../../../../../core/method.dart';

class UserNameRow extends StatefulWidget {
  final String image, email, name;

  const UserNameRow(
      {super.key,
      required this.email,
      required this.image,
      required this.name});

  @override
  State<UserNameRow> createState() => _UserNameRowState();
}

class _UserNameRowState extends State<UserNameRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: responsiveWeidth(context, 120),
            height: 100.h,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: /* "$baseUrl/images${widget.image}" */
                    "https://th.bing.com/th/id/OIP.GHGGLYe7gDfZUzF_tElxiQHaHa?rs=1&pid=ImgDetMain",
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
          width: responsiveWeidth(context, 16),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                color: SharedColor.whiteColor,
                text: widget.name,
                fontSize: getResponsiveFont(context, fontSize: 25),
                fontWeight: FontWeight.w700,
              ),
              customText(
                color: SharedColor.whiteColor,
                text: widget.email,
                fontSize: getResponsiveFont(context, fontSize: 15),
              ),
            ],
          ),
        )
      ],
    );
  }
}
