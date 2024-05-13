import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/home/presentation/bloc/section_bloc/section_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/section_bloc/section_state.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/section_screen.dart';

class SectionList extends StatelessWidget {
  const SectionList({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<SectionCubit, SectionState>(
      builder: (context, state) {
        if (state is SectionSuccessState) {
          catID1 = state.sectionModel.data![0].id;
          return SliverGrid.builder(
            itemCount: state.sectionModel.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: height > width ? 3 : 5,
                childAspectRatio: 2 / 2.2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SectionScreen(),
                  ));
                  catID = state.sectionModel.data![index].id;
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  width: 220.w,
                  decoration: BoxDecoration(
                    color: SharedColor.whiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.all(10.w),
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
                                "$baseUrl/images${state.sectionModel.data![index].image}",
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
                        width: 20.w,
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: customText(
                              text: state.sectionModel.data![index].name ?? "",
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
        } else if (state is SectionIsLoadingState) {
          return SliverGrid.builder(
            itemCount: 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 2 / 2.2.h),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                width: 220.w,
                decoration: BoxDecoration(
                  color: SharedColor.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  margin: EdgeInsets.all(10.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    /*  image: DecorationImage(
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
              );
            },
          );
        } else {
          return SliverGrid.builder(
            itemCount: 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 2 / 2.2.h),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                width: 220.w,
                decoration: BoxDecoration(
                  color: SharedColor.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Container(
                  width: 70.w,
                  height: 70.h,
                  margin: EdgeInsets.all(10.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    /*  image: DecorationImage(
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
              );
            },
          );
        }
      },
    );
  }
}
