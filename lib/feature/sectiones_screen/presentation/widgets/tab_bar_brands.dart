import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/home/presentation/bloc/brandes_bloc/brand_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/brandes_bloc/brand_state.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/bloc/section_product_cubit.dart';

import '../../../../generated/l10n.dart';

class TabBarBrands extends StatefulWidget {
  const TabBarBrands({super.key});

  @override
  State<TabBarBrands> createState() => _TabBarBrandsState();
}

class _TabBarBrandsState extends State<TabBarBrands> {
  int currentNumber = 0;
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(
      builder: (context, state) {
        if (state is BrandIsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: SharedColor.mainColor,
            ),
          );
        } else if (state is BrandSuccesstState) {
          return SizedBox(
            width: double.infinity,
            height: 130.h,
            child: DefaultTabController(
              length: state.brandModel.data!.length + 1,
              child: TabBar(
                automaticIndicatorColorAdjustment: false,
                indicatorSize: TabBarIndicatorSize.label,
                splashFactory: NoSplash.splashFactory,
                indicator: const BoxDecoration(color: Colors.transparent),
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                onTap: (value) {
                  setState(() {
                    currentNumber = value;
                    x = value;

                    value == 0
                        ? brandID = []
                        : brandID.add(state.brandModel.data![value - 1].id);
                    print("the Brand Id is ${brandID}");
                    // print(value);
                  });
                },
                enableFeedback: false,
                unselectedLabelColor: Colors.black,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorWeight: 4,
                indicatorColor: Colors.transparent,
                tabs: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentNumber = 0;
                        brandID = [];
                        print("the Brand Id is ${brandID}");
                      });
                      BlocProvider.of<SectionProductCubit>(context)
                          .getSectionPRoductMethod({
                        "cat": catID,
                        "categories": [catID],
                        "brands": [],
                        "options": [],
                        "price": [price1, 1000],
                        "sort": "desc"
                        // "paginate":1
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          horizontal: responsiveWeidth(context, 10),
                          vertical: 15.h),
                      width: responsiveWeidth(context, 150),
                      decoration: BoxDecoration(
                        color: SharedColor.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.6), // Set the shadow color
                            spreadRadius: 2, // Set how far the shadow spreads
                            blurRadius: 7, // Set the blur radius
                            offset: const Offset(
                                0, 1), // Set the offset of the shadow
                          ),
                        ],
                        border: Border.all(
                            color: currentNumber == 0
                                ? SharedColor.orangeColor
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: customText(
                        text: S.of(context).company,
                        color: Colors.black,
                        fontSize: getResponsiveFont(context, fontSize: 30),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  for (int i = 0; i < state.brandModel.data!.length; i++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentNumber = i + 1;

                          brandID = state.brandModel.data![i].id;
                          print("the Brand Id is 1${brandID}");
                        });
                        BlocProvider.of<SectionProductCubit>(context)
                            .getSectionPRoductMethod({
                          "cat": catID,
                          "categories": [catID],
                          "brands": [brandID],
                          "options": [],
                          "price": [price1, 1000],
                          "sort": "desc"
                          // "paginate":1
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: responsiveWeidth(context, 10),
                            vertical: 15.h),
                        width: responsiveWeidth(context, 150),
                        decoration: BoxDecoration(
                          color: SharedColor.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.6), // Set the shadow color
                              spreadRadius: 2, // Set how far the shadow spreads
                              blurRadius: 7, // Set the blur radius
                              offset: const Offset(
                                  0, 1), // Set the offset of the shadow
                            ),
                          ],
                          border: Border.all(
                              color: currentNumber == i + 1
                                  ? SharedColor.orangeColor
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: responsiveWeidth(context, 50),
                              height: 50.h,
                              margin:
                                  EdgeInsets.all(responsiveWeidth(context, 10)),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                /*  image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://th.bing.com/th/id/OIP.QvUVFSkgO0eehYr_kFADGAHaE8?w=284&h=190&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                                ), */
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      "$baseUrl/images${state.brandModel.data![i].image}",
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                    color: SharedColor.mainColor,
                                  )),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: responsiveWeidth(context, 20),
                            ),
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: customText(
                                    text: state.brandModel.data![i].name ?? "",
                                    color: SharedColor.greyFieldColor,
                                    fontSize: 15.w,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
