// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/home/presentation/bloc/offer_bloc/offer_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/offer_bloc/offer_state.dart';
import 'package:secondwork/feature/home/presentation/bloc/offer_filter_product/offer_product_cubit.dart';
import 'package:secondwork/feature/home/presentation/view/spacific_offer_products.dart';

class OfferList extends StatelessWidget {
  const OfferList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfferCubit, OfferState>(
      builder: (context, state) {
        if (state is OfferSuccessState) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.offerModel.data!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  await BlocProvider.of<OfferProductCubit>(context)
                      .getProductOffer(state.offerModel.data![index].id ?? 0);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OfferProducts(
                      title: state.offerModel.data![index].name ?? "",
                    ),
                  ));
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  width: 300,
                  decoration: BoxDecoration(
                    color: SharedColor.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.6), // Set the shadow color
                        spreadRadius: 2, // Set how far the shadow spreads
                        blurRadius: 7, // Set the blur radius
                        offset:
                            const Offset(0, 1), // Set the offset of the shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 125,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),

                          /*  image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "$baseUrl/images${state.offerModel.data![index].image}",
                            ),
                          ), */
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl:
                                "$baseUrl/images${state.offerModel.data![index].image}",
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                              color: SharedColor.mainColor,
                            )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: customText(
                                text: state.offerModel.data![index].name ?? "",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is OfferIsLoadingState) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                width: 300.w,
                decoration: BoxDecoration(
                  color: SharedColor.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.6), // Set the shadow color
                      spreadRadius: 2, // Set how far the shadow spreads
                      blurRadius: 7, // Set the blur radius
                      offset:
                          const Offset(0, 1), // Set the offset of the shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: SharedColor.mainColor,
                  ),
                ),
              );
            },
          );
        } else if (state is OfferIsEmpytState) {
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
