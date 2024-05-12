import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/home/presentation/bloc/slider_bloc/slider_cubit.dart';
import 'package:secondwork/feature/home/presentation/bloc/slider_bloc/slider_state.dart';

class SliderBody extends StatefulWidget {
  const SliderBody({super.key});

  @override
  State<SliderBody> createState() => _SliderBodyState();
}

List<String> imageList = [
  "https://th.bing.com/th/id/OIP.qta7ZUomhRLuN2UBURRudgHaE8?w=297&h=198&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  "https://th.bing.com/th/id/OIP.WduW6fA3wKxWZkG52m3zUAHaHa?w=197&h=198&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  "https://th.bing.com/th/id/OIP.QvUVFSkgO0eehYr_kFADGAHaE8?w=284&h=190&c=7&r=0&o=5&dpr=1.3&pid=1.7",
];

class _SliderBodyState extends State<SliderBody> {
  CarouselController carouselController = CarouselControllerImpl();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderSaccussState) {
          return SizedBox(
            child: CarouselSlider.builder(
              itemCount: state.sliderModel.data!.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                            .withOpacity(0.6), // Set the shadow color
                        spreadRadius: 3, // Set how far the shadow spreads
                        blurRadius: 7, // Set the blur radius
                        offset:
                            const Offset(0, 2), // Set the offset of the shadow
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        "$baseUrl/images${state.sliderModel.data![index].image}",
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                initialPage: 2,
              ),
            ),
          );
        } else if (state is SliderISLoadingState) {
          return CarouselSlider.builder(
            itemCount: 0,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
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
                child: const Center(
                  child: CircularProgressIndicator(
                    color: SharedColor.mainColor,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              initialPage: 0,
            ),
          );
        } else {
          return CarouselSlider.builder(
            itemCount: 0,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
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
                child: Center(
                  child: customText(
                    text: "This Slider is Empty",
                    color: Colors.black,
                    fontSize: 20.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              initialPage: 0,
            ),
          );
        }
      },
    );
  }
}
