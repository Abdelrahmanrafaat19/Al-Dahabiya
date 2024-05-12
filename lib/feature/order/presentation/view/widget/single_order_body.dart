import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/order/data/all_order_model/all_order_sub_field.dart';
import 'package:secondwork/feature/order/presentation/bloc/cancel_order_bloc/cancel_order_cubit.dart';
import 'package:secondwork/feature/order/presentation/bloc/cancel_order_bloc/cancel_order_state.dart';
import 'package:secondwork/feature/order/presentation/view/all_order.dart';
import 'package:secondwork/generated/l10n.dart';

class SingleOrderBody extends StatefulWidget {
  final dynamic orderNumber,
      date,
      payment,
      status,
      orderPrice,
      shipingPrice,
      total;
  final List<Products> product;
  const SingleOrderBody({
    super.key,
    required this.date,
    required this.orderNumber,
    required this.orderPrice,
    required this.payment,
    required this.product,
    required this.shipingPrice,
    required this.status,
    required this.total,
  });

  @override
  State<SingleOrderBody> createState() => _SingleOrderBodyState();
}

class _SingleOrderBodyState extends State<SingleOrderBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CancelOrderCubit, CancelOrderState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: responsiveWeidth(context, 10),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.bookmark_outline,
                      color: SharedColor.mainColor,
                      size: getResponsiveFont(context, fontSize: 30),
                    ),
                    SizedBox(
                      width: responsiveWeidth(context, 10),
                    ),
                    customText(
                      text: "${S.of(context).ordernumber} : ",
                      color: Colors.black,
                      fontSize: getResponsiveFont(context, fontSize: 20),
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      width: responsiveWeidth(context, 10),
                    ),
                    customText(
                      text: "${widget.orderNumber}",
                      color: Colors.black,
                      fontSize: getResponsiveFont(context, fontSize: 20),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: SharedColor.mainColor,
                      size: getResponsiveFont(context, fontSize: 30),
                    ),
                    SizedBox(
                      width: responsiveWeidth(context, 10),
                    ),
                    customText(
                      text: "${widget.date}",
                      color: Colors.black,
                      fontSize: getResponsiveFont(context, fontSize: 20),
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.payment_outlined,
                      color: SharedColor.mainColor,
                      size: getResponsiveFont(context, fontSize: 30),
                    ),
                    SizedBox(
                      width: responsiveWeidth(context, 10),
                    ),
                    customText(
                      text: "${widget.payment}",
                      color: Colors.black,
                      fontSize: getResponsiveFont(context, fontSize: 20),
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.alt_route_rounded,
                      color: SharedColor.mainColor,
                      size: getResponsiveFont(context, fontSize: 30),
                    ),
                    SizedBox(
                      width: responsiveWeidth(context, 10),
                    ),
                    customText(
                      text: "${widget.status}",
                      color: Colors.black,
                      fontSize: getResponsiveFont(context, fontSize: 20),
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                customText(
                  text: S.of(context).order,
                  color: Colors.black,
                  fontSize: getResponsiveFont(context, fontSize: 20),
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(responsiveWeidth(context, 20)),
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWeidth(context, 10),
                          vertical: 5.h,
                        ),
                        width: responsiveWeidth(context, 170),
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: SharedColor.whiteColor,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.6), // Set the shadow color
                              spreadRadius: 3, // Set how far the shadow spreads
                              blurRadius: 7, // Set the blur radius
                              offset: const Offset(
                                  0, 2), // Set the offset of the shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                width: responsiveWeidth(context, 150),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl:
                                        "$baseUrl/images${widget.product[index].image}",
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator(
                                      color: SharedColor.mainColor,
                                    )),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Expanded(
                              child: customText(
                                  text: "${widget.product[index].name}",
                                  color: SharedColor.orangeColor,
                                  fontSize:
                                      getResponsiveFont(context, fontSize: 15),
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                customText(
                                  text: "${S.of(context).unitprice}:",
                                  color: SharedColor.orangeColor,
                                  fontSize:
                                      getResponsiveFont(context, fontSize: 15),
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: responsiveWeidth(context, 10),
                                ),
                                Flexible(
                                  child: customText(
                                    text: "${widget.product[index].price}",
                                    color: SharedColor.orangeColor,
                                    fontSize: getResponsiveFont(context,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: customText(
                                    text: "${S.of(context).quantity}:",
                                    color: SharedColor.orangeColor,
                                    fontSize: getResponsiveFont(context,
                                        fontSize: 15),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: responsiveWeidth(context, 10),
                                ),
                                Flexible(
                                  child: customText(
                                    text: "${widget.product[index].quantity}",
                                    color: SharedColor.orangeColor,
                                    fontSize: getResponsiveFont(context,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: "${S.of(context).orderprice}:",
                      color: SharedColor.orangeColor,
                      fontSize: getResponsiveFont(context, fontSize: 20),
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: responsiveWeidth(context, 10),
                    ),
                    Flexible(
                      child: customText(
                        text: "${widget.orderPrice}",
                        color: SharedColor.orangeColor,
                        fontSize: getResponsiveFont(context, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: "${S.of(context).shippingcharengs}:",
                      color: SharedColor.orangeColor,
                      fontSize: getResponsiveFont(context, fontSize: 20),
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: responsiveWeidth(context, 10),
                    ),
                    Flexible(
                      child: customText(
                        text: "${widget.shipingPrice}",
                        color: SharedColor.orangeColor,
                        fontSize: getResponsiveFont(context, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: "${S.of(context).totle}:",
                      color: SharedColor.orangeColor,
                      fontSize: getResponsiveFont(context, fontSize: 20),
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: responsiveWeidth(context, 10),
                    ),
                    Flexible(
                      child: customText(
                        text: "${widget.total}",
                        color: SharedColor.orangeColor,
                        fontSize: getResponsiveFont(context, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 45.w),
                  child: defaultButton(
                    text: S.of(context).cancelorder,
                    textcolor: SharedColor.whiteColor,
                    fontSize: getResponsiveFont(context, fontSize: 20),
                    color: SharedColor.orangeColor,
                    paddingrl: responsiveWeidth(context, 20),
                    paddingtb: 10.h,
                    onTap: () {
                      BlocProvider.of<CancelOrderCubit>(context)
                          .cancelOrderMethod({"order_id": widget.orderNumber});
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is CancelOrderIsLoadingState) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: SharedColor.mainColor,
                  ))),
            ),
          );
        } else if (state is CancelOrderSucceessState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const AllOrderScreen(),
            ),
            (route) => false,
          );
        } else if (state is CancelOrderFailureState) {
          Navigator.of(context).pop();

          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              content: Text("حدث مشكلة حاول مجددا"),
            ),
          );
        }
      },
    );
  }
}
