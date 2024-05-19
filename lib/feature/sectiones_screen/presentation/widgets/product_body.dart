import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/product_brands/presentation/view/widget/brand_product_container.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/bloc/section_product_cubit.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/bloc/section_product_state.dart';
import 'package:secondwork/feature/single_product/presentation/bloc/single_product_cubit.dart';
import 'package:secondwork/feature/single_product/presentation/views/single_product.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({super.key});

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<SectionProductCubit, SectionProductState>(
      builder: (context, state) {
        if (state is SectionProductSuccessState) {
          return Container(
            margin: EdgeInsets.only(
                left: responsiveWeidth(context, 10),
                right: responsiveWeidth(context, 10),
                top: 10.h),
            width: double.infinity,
            child: ResponsiveGridList(
              scroll: false,
              shrinkWrap: true,
              desiredItemWidth: width < height ? 170 : 230,
              children: List.generate(
                  state.sectionsProductModel.data!.length,
                  (index) => InkWell(
                        onTap: () async {
                          await BlocProvider.of<SingleProductCubit>(context)
                              .getSingleProduct(
                                  state.sectionsProductModel.data![index].id!);
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SingleProduct(),
                          ));
                        },
                        child: BandProductContainer(
                          id: state.sectionsProductModel.data![index].id,
                          price: state.sectionsProductModel.data![index].price,
                          discounPrice: state
                              .sectionsProductModel.data![index].discountPrice,
                          name: state.sectionsProductModel.data![index].name ??
                              "",
                          image:
                              state.sectionsProductModel.data![index].image ??
                                  "",
                          hasDiscount: state
                              .sectionsProductModel.data![index].hasDiscount!,
                        ),
                      )),
            ),
          );
        } else if (state is SectionProductIsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: SharedColor.mainColor,
            ),
          );
        } else if (state is SectionProductFailuretate) {
          return const Center(
            child: Text(""),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
