import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/product_brands/presentation/bloc/product_brand_bloc/product_brand_cubit.dart';
import 'package:secondwork/feature/product_brands/presentation/bloc/product_brand_bloc/product_brand_state.dart';
import 'package:secondwork/feature/product_brands/presentation/view/widget/brand_product_container.dart';
import 'package:secondwork/feature/single_product/presentation/bloc/single_product_cubit.dart';
import 'package:secondwork/feature/single_product/presentation/views/single_product.dart';

class ProductBrandsBody extends StatelessWidget {
  const ProductBrandsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<ProductBrandCubit, ProductBrandState>(
      builder: (context, state) {
        if (state is ProductBrandSuccessState) {
          return Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10.h,
              ),
              width: double.infinity,
              child: ResponsiveGridList(
                desiredItemWidth: width < height ? 170 : 230,
                children: List.generate(
                    state.productBrandsModel["data"].length,
                    (index) => InkWell(
                          onTap: () async {
                            await BlocProvider.of<SingleProductCubit>(context)
                                .getSingleProduct(state
                                    .productBrandsModel["data"][index]["id"]);
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SingleProduct(),
                            ));
                          },
                          child: BandProductContainer(
                            price: state.productBrandsModel["data"][index]
                                ["price"],
                            discounPrice: state.productBrandsModel["data"]
                                [index]["discount_price"],
                            name: state.productBrandsModel["data"][index]
                                ["name"],
                            image: state.productBrandsModel["data"][index]
                                ["image"],
                            hasDiscount: state.productBrandsModel["data"][index]
                                ["has_discount"],
                          ),
                        )),
              ));
        } else if (state is ProductBrandIsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: SharedColor.mainColor,
            ),
          );
        } else if (state is ProductBrandIsEmptyState) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset("lib/core/assestes/nodatafound.png"),
            ),
          );
        } else if (state is ProductBrandFailuretate) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Text(state.message),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
