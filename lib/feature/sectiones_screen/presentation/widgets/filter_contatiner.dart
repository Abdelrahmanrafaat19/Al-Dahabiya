import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/widgets/product_body.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/widgets/slider_container.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/widgets/tab_bar_brands.dart';

import '../../../../generated/l10n.dart';

class FilterContainer extends StatefulWidget {
  const FilterContainer({
    super.key,
  });

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  bool visible = false;
  double sliderValue = 0;
  bool sliderVisible = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: SharedColor.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6), // Set the shadow color
                  spreadRadius: 3, // Set how far the shadow spreads
                  blurRadius: 7, // Set the blur radius
                  offset: const Offset(0, 2), // Set the offset of the shadow
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
                                fontSize:
                                    getResponsiveFont(context, fontSize: 15),
                              ),
                              customText(
                                  text: S.of(context).brand,
                                  color: Colors.black,
                                  fontSize:
                                      getResponsiveFont(context, fontSize: 20),
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
                                fontSize:
                                    getResponsiveFont(context, fontSize: 15),
                              ),
                              customText(
                                  text: S.of(context).highprice,
                                  color: Colors.black,
                                  fontSize:
                                      getResponsiveFont(context, fontSize: 20),
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
    );
  }
}


/* InkWell(
                  onTap: () async {
                    await BlocProvider.of<SingleProductCubit>(context)
                        .getSingleProduct(
                            state.productBrandsModel["data"][index]["id"]);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SingleProduct(),
                    ));
                  },
                  child: BandProductContainer(
                    price: state.productBrandsModel["data"][index]["price"],
                    discounPrice: state.productBrandsModel["data"][index]
                        ["discount_price"],
                    name: state.productBrandsModel["data"][index]["name"],
                    image: state.productBrandsModel["data"][index]["image"],
                    hasDiscount: state.productBrandsModel["data"][index]
                        ["has_discount"],
                  ),
                ) */