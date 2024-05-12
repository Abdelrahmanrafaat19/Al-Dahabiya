import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/bloc/section_product_cubit.dart';

import '../../../../core/componant/custam_text.dart';
import '../../../../generated/l10n.dart';

class SliderContainer extends StatefulWidget {
  const SliderContainer({super.key});

  @override
  State<SliderContainer> createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  double sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              customText(
                text: "$price1",
                color: Colors.black,
                fontSize: getResponsiveFont(context, fontSize: 20),
              ),
              Expanded(
                child: Slider(
                  thumbColor: SharedColor.blueColor,
                  value: sliderValue,
                  onChanged: (value) {
                    print(value * 100);
                    setState(() {
                      sliderValue = value;
                      price1 = value * 1000;
                    });
                  },
                ),
              ),
              customText(
                text: "1000",
                color: Colors.black,
                fontSize: getResponsiveFont(context, fontSize: 20),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 45.w),
            child: defaultButton(
                text: S.of(context).search,
                textcolor: SharedColor.whiteColor,
                fontSize: getResponsiveFont(context, fontSize: 20),
                color: SharedColor.mainColor,
                paddingrl: responsiveWeidth(context, 5),
                paddingtb: 10.h,
                onTap: () {
                  BlocProvider.of<SectionProductCubit>(context)
                      .getSectionPRoductMethod({
                    "cat": 52,
                    "categories": [52],
                    "brands": brandID,
                    "options": [],
                    "price": [price1, 1000],
                    "sort": "desc"
                    // "paginate":1
                  });
                }),
          )
        ],
      ),
    );
  }
}
