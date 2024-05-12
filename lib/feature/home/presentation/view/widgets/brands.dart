import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/home/presentation/bloc/brandes_bloc/brand_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/brandes_bloc/brand_state.dart';
import 'package:secondwork/feature/product_brands/presentation/bloc/product_brand_bloc/product_brand_cubit.dart';
import 'package:secondwork/feature/product_brands/presentation/view/prduct_brand.dart';

class BrandList extends StatelessWidget {
  const BrandList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandCubit, BrandState>(
      builder: (context, state) {
        if (state is BrandSuccesstState) {
          return ListView.builder(
            itemCount: state.brandModel.data!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              catID = state.brandModel.data![0].id;
              return InkWell(
                onTap: () async {
                  await BlocProvider.of<ProductBrandCubit>(context)
                      .getProductBrand(state.brandModel.data![index].id ?? 0);
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductBrand(
                        title: state.brandModel.data![index].name,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  width: 220,
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
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          /* image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://th.bing.com/th/id/OIP.QvUVFSkgO0eehYr_kFADGAHaE8?w=284&h=190&c=7&r=0&o=5&dpr=1.3&pid=1.7"))), */
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl:
                                "$baseUrl/images${state.brandModel.data![index].image}",
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                              color: SharedColor.mainColor,
                            )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: customText(
                              text: state.brandModel.data![index].name ?? "",
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is BrandIsLoadingState) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 0,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                width: 220.w,
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
                child: Column(
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.h,
                      margin: EdgeInsets.all(10.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        /*   image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://th.bing.com/th/id/OIP.QvUVFSkgO0eehYr_kFADGAHaE8?w=284&h=190&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                        ), */
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: SharedColor.mainColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: SharedColor.mainColor,
            ),
          );
        }
      },
    );
  }
}
