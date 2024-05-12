import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/feature/home/presentation/bloc/section_bloc/section_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/section_bloc/section_state.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/bloc/section_product_cubit.dart';

import '../../../../core/componant/custam_text.dart';
import '../../../../core/theme/color.dart';

class TabBarCustam extends StatefulWidget {
  const TabBarCustam({
    super.key,
  });

  @override
  State<TabBarCustam> createState() => _TabBarCustamState();
}

class _TabBarCustamState extends State<TabBarCustam> {
  late TabController tabController;
  int currentNumber = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionCubit, SectionState>(builder: (context, state) {
      if (state is SectionIsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(color: SharedColor.mainColor),
        );
      } else if (state is SectionSuccessState) {
        return Container(
          decoration: const BoxDecoration(
            boxShadow: [],
            color: Colors.transparent,
          ),
          child: DefaultTabController(
            length: state.sectionModel.data!.length,
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
                  catID = state.sectionModel.data![value].id;
                  print("The CATID is $catID");
                });
                BlocProvider.of<SectionProductCubit>(context)
                    .getSectionPRoductMethod({
                  "cat": catID,
                  "categories": catID,
                  "brands": [],
                  "options": [],
                  "price": [price1, 1000],
                  "sort": "desc"
                  // "paginate":1
                });
              },
              enableFeedback: false,
              unselectedLabelColor: Colors.black,
              dividerColor: SharedColor.orangeColor,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorWeight: 4,
              indicatorColor: Colors.transparent,
              tabs: [
                for (int i = 0; i < state.sectionModel.data!.length; i++)
                  Container(
                    margin: EdgeInsets.only(bottom: 30.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWeidth(context, 30),
                      vertical: 10.h,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: currentNumber == i
                          ? SharedColor.mainColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: FittedBox(
                      child: customText(
                        text: state.sectionModel.data![i].name ?? "",
                        color: SharedColor.whiteColor,
                        fontSize: getResponsiveFont(context, fontSize: 15),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      } else if (state is SectionFailureState) {
        return const Text("");
      } else {
        return const SizedBox();
      }
    });
  }
}
