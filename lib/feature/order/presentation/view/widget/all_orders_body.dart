import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';
import 'package:secondwork/feature/order/presentation/bloc/all_order_cubit.dart';
import 'package:secondwork/feature/order/presentation/bloc/all_order_state.dart';
import 'package:secondwork/feature/order/presentation/view/single_order_screen.dart';

import '../../../../../generated/l10n.dart';

class AllOrdersBody extends StatefulWidget {
  const AllOrdersBody({super.key});

  @override
  State<AllOrdersBody> createState() => _AllOrdersBodyState();
}

class _AllOrdersBodyState extends State<AllOrdersBody> {
  @override
  void initState() {
    BlocProvider.of<AllOrderCubit>(context).getAllOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllOrderCubit, AllOrderState>(
      builder: (context, state) {
        if (state is AllOrderSuccessState) {
          return SizedBox(
              width: double.infinity,
              child: ResponsiveGridList(
                desiredItemWidth: 350,
                children: List.generate(
                    state.data.data!.length,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SingleOrderScreen(
                                  date: state.data.data![index].date,
                                  orderNumber: state.data.data![index].id,
                                  orderPrice: state.data.data![index].total,
                                  payment: state.data.data![index].paymentType,
                                  product:
                                      state.data.data![index].products ?? [],
                                  shipingPrice:
                                      state.data.data![index].shipping,
                                  status: state.data.data![index].status,
                                  total: (state.data.data![index].total! +
                                      state.data.data![index].shipping!)),
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 5.h,
                                bottom: 5.h,
                                left: responsiveWeidth(context, 10)),
                            margin: EdgeInsets.symmetric(
                              horizontal: responsiveWeidth(context, 10),
                              vertical: 5.h,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: Colors.black,
                                width: responsiveWeidth(context, 3),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText(
                                          text:
                                              "${S.of(context).ordernumber} : ",
                                          color: SharedColor.mainColor,
                                          fontSize: getResponsiveFont(context,
                                              fontSize: 20),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        customText(
                                          text: "${state.data.data![index].id}",
                                          color: Colors.black,
                                          fontSize: getResponsiveFont(context,
                                              fontSize: 20),
                                          fontWeight: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customText(
                                          text:
                                              "${S.of(context).orderstatus} : ",
                                          color: SharedColor.mainColor,
                                          fontSize: getResponsiveFont(context,
                                              fontSize: 20),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        customText(
                                          text:
                                              "${state.data.data![index].status}",
                                          color: Colors.black,
                                          fontSize: getResponsiveFont(context,
                                              fontSize: 20),
                                          fontWeight: FontWeight.w500,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: SharedColor.greyFieldColor,
                                  size:
                                      getResponsiveFont(context, fontSize: 50),
                                )
                              ],
                            ),
                          ),
                        )),
              ));
        } else if (state is AllOrderIsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: SharedColor.mainColor,
            ),
          );
        } else if (state is AllOrderIsEmptyState) {
          return Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "lib/core/assestes/img.png",
                  ),
                ),
              ),
            ),
          );
        } else if (state is AllOrderFailureState) {
          if (state.message == 401) {
            return TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              child: Text(S.of(context).loginagain),
            );
          } else {
            return Text("${state.message}");
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
/* Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: SharedColor.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.6), // Set the shadow color
                          spreadRadius: 2, // Set how far the shadow spreads
                          blurRadius: 7, // Set the blur radius
                          offset: const Offset(
                              0, 1), // Set the offset of the shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 125.w,
                          margin: EdgeInsets.all(10.w),
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
                                  text:
                                      state.offerModel.data![index].name ?? "",
                                  color: Colors.black,
                                  fontSize: 20.w,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                     */