import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/home/presentation/bloc/offer_filter_product/offer_product_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/offer_filter_product/offer_product_state.dart';
import 'package:secondwork/feature/home/presentation/view/widgets/product_offer_contatiner.dart';
import 'package:secondwork/feature/single_product/presentation/bloc/single_product_cubit.dart';
import 'package:secondwork/feature/single_product/presentation/views/single_product.dart';

class OfferProductsBody extends StatelessWidget {
  const OfferProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<OfferProductCubit, OfferProductsState>(
      builder: (context, state) {
        if (state is OfferProductsSuccessState) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            width: double.infinity,
            child: ResponsiveGridList(
              desiredItemWidth: width < height ? 170 : 220,
              children: List.generate(
                  state.offerFilterProductModel.data!.length,
                  (index) => GestureDetector(
                        onTap: () async {
                          await BlocProvider.of<SingleProductCubit>(context)
                              .getSingleProduct(state
                                  .offerFilterProductModel.data![index].id!);
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SingleProduct(),
                          ));
                        },
                        child: OfferProductContainer(
                          id: state.offerFilterProductModel.data![index].id,
                          price:
                              state.offerFilterProductModel.data![index].price,
                          discounPrice: state.offerFilterProductModel
                              .data![index].discountPrice,
                          name:
                              state.offerFilterProductModel.data![index].name ??
                                  "",
                          image: state.offerFilterProductModel.data![index]
                                  .productPhoto ??
                              "",
                          hasDiscount: state.offerFilterProductModel
                                  .data![index].hasDiscount ??
                              false,
                        ),
                      )),
            ),
          );
        } else if (state is OfferProductsIsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: SharedColor.mainColor,
            ),
          );
        } else if (state is OfferProductsIsEmityState) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset("lib/core/assestes/nodatafound.png"),
            ),
          );
        } else if (state is OfferProductsFailureState) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Text(state.message),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
/* GridView.builder(
              itemCount: state.offerFilterProductModel.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: width < height ? 15.h : 15.w,
                  crossAxisSpacing: width < height ? 15.w : 15.h,
                  childAspectRatio: width < height ? 2.w / 2.5.h : 2.h / 1.w),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    await BlocProvider.of<SingleProductCubit>(context)
                        .getSingleProduct(
                            state.offerFilterProductModel.data![index].id!);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SingleProduct(),
                    ));
                  },
                  child: OfferProductContainer(
                    id: state.offerFilterProductModel.data![index].id,
                    price: state.offerFilterProductModel.data![index].price,
                    discounPrice: state
                        .offerFilterProductModel.data![index].discountPrice,
                    name: state.offerFilterProductModel.data![index].name ?? "",
                    image: state.offerFilterProductModel.data![index]
                            .productPhoto ??
                        "",
                    hasDiscount: state
                            .offerFilterProductModel.data![index].hasDiscount ??
                        false,
                  ),
                );
              },
            ), */