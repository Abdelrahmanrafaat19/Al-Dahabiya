import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/feature/home/presentation/view/widgets/brands.dart';
import 'package:secondwork/feature/home/presentation/view/widgets/offer_list.dart';
import 'package:secondwork/feature/home/presentation/view/widgets/search_field.dart';
import 'package:secondwork/feature/home/presentation/view/widgets/section_list.dart';
import 'package:secondwork/feature/home/presentation/view/widgets/slider.dart';
import 'package:secondwork/generated/l10n.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SearchField(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(child: SliderBody()),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width < height ? 10.w : 10.h),
            child: customText(
              text: S.of(context).offer,
              color: Colors.black,
              fontSize: width < height ? 20.w : 20.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            width: double.infinity,
            height: 140,
            child: OfferList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width < height ? 10.w : 10.h),
            child: customText(
              text: S.of(context).brand,
              color: Colors.black,
              fontSize: width < height ? 20.w : 20.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            width: double.infinity,
            height: 170,
            child: BrandList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width < height ? 10.w : 10.h),
            child: customText(
              text: S.of(context).section,
              color: Colors.black,
              fontSize: width < height ? 20.w : 20.h,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SectionList(),
      ],
    );
  }
}
