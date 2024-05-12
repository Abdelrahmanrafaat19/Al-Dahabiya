import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/widgets/tab_bar.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/widgets/product_body.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/widgets/slider_container.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/widgets/tab_bar_brands.dart';
import 'package:secondwork/core/theme/color.dart';
import '../../../core/scal_factor_method.dart';
import '../../../generated/l10n.dart';

import 'package:secondwork/core/method.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({
    super.key,
  });

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen>
    with SingleTickerProviderStateMixin {
  bool visible = false;
  double sliderValue = 0;
  bool sliderVisible = false;

  late TabController tabController;
  int currentNumber = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.h,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80.h),
            child: const TabBarCustam(),
          ),
          centerTitle: true,
          // forceMaterialTransparency: true,
          backgroundColor: const Color.fromARGB(255, 200, 99, 83),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              size: getResponsiveFont(context, fontSize: 30),
            ),
          ),
          title: customText(
            text: S.of(context).section,
            color: Colors.white,
            fontSize: getResponsiveFont(context, fontSize: 20),
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: SharedColor.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.6), // Set the shadow color
                      spreadRadius: 3, // Set how far the shadow spreads
                      blurRadius: 7, // Set the blur radius
                      offset:
                          const Offset(0, 2), // Set the offset of the shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(responsiveWeidth(context, 10)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  customText(
                                    text: S.of(context).brand,
                                    color: SharedColor.greyFieldColor,
                                    fontSize: getResponsiveFont(context,
                                        fontSize: 15),
                                  ),
                                  customText(
                                      text: S.of(context).brand,
                                      color: Colors.black,
                                      fontSize: getResponsiveFont(context,
                                          fontSize: 20),
                                      fontWeight: FontWeight.w600),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () => setState(() {
                                visible = !visible;
                                sliderVisible = false;
                              }),
                              child: Icon(
                                visible == false
                                    ? Icons.arrow_drop_down_sharp
                                    : Icons.arrow_drop_up_outlined,
                                color: SharedColor.greyFieldColor,
                                size: getResponsiveFont(context, fontSize: 30),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50.h,
                      width: responsiveWeidth(context, 2),
                      color: SharedColor.greyFieldColor,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => setState(() {
                          sliderVisible = !sliderVisible;
                          visible = false;
                        }),
                        child: Container(
                          margin: EdgeInsets.all(responsiveWeidth(context, 10)),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  customText(
                                    text: S.of(context).arrange,
                                    color: SharedColor.greyFieldColor,
                                    fontSize: getResponsiveFont(context,
                                        fontSize: 15),
                                  ),
                                  customText(
                                      text: S.of(context).highprice,
                                      color: Colors.black,
                                      fontSize: getResponsiveFont(context,
                                          fontSize: 20),
                                      fontWeight: FontWeight.w600),
                                ],
                              ),
                              SizedBox(
                                width: responsiveWeidth(context, 10),
                              ),
                              Icon(
                                sliderVisible == false
                                    ? Icons.arrow_drop_down_sharp
                                    : Icons.arrow_drop_up_outlined,
                                color: SharedColor.greyFieldColor,
                                size: getResponsiveFont(context, fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: visible,
                child: const TabBarBrands(),
              ),
              Visibility(
                visible: sliderVisible,
                child: const SliderContainer(),
              ),
              const ProductBody(),
            ],
          ),
        ));
  }
}
