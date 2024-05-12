import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/cart/data/cart_model/cart_model.dart';
import 'package:secondwork/feature/cart/presentation/bloc/add_cart_data_cubit/add_cart_data_cubit.dart';
import 'package:secondwork/feature/single_product/data/single_product_model/single_product_model.dart';
import 'package:secondwork/feature/single_product/presentation/views/widget/add_to_cart_button.dart';

import 'package:secondwork/feature/single_product/presentation/views/widget/quantity_row.dart';
import 'package:secondwork/feature/single_product/presentation/views/widget/single_product_slider.dart';

import '../../../../../core/scal_factor_method.dart';

// ignore: must_be_immutable
class ProductData extends StatefulWidget {
  List<dynamic> images;
  dynamic type, desc, productQuatity;
  SingleProductModel data;
  ProductData(
      {super.key,
      required this.images,
      required this.type,
      required this.desc,
      required this.data,
      required this.productQuatity});

  @override
  State<ProductData> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  int quntity = 1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCartDataCubit, AddCartDataState>(
      listener: (context, state) {
        if (state is AddCartDataLoading) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                  width: responsiveWeidth(context, 100),
                  height: responsiveHieght(context, 100),
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: SharedColor.mainColor,
                  ))),
            ),
          );
        } else if (state is AddCartDataSuccess) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                width: responsiveWeidth(context, 100),
                height: responsiveHieght(context, 100),
                child: const Center(child: Text("This data us Added")),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          top: 150,
          child: Container(
            height: double.infinity,
            padding:
                EdgeInsets.symmetric(horizontal: responsiveWeidth(context, 10)),
            decoration: BoxDecoration(
              color: SharedColor.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200.h,
                  child: SingleProductSlider(
                    image: widget.images,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                customText(
                  text: widget.type,
                  color: Colors.black,
                  fontSize: getResponsiveFont(context, fontSize: 20),
                  fontWeight: FontWeight.w300,
                ),
                SizedBox(
                  height: 10.h,
                ),
                customText(
                  text: "وصف المنتج",
                  color: Colors.black,
                  fontSize: getResponsiveFont(context, fontSize: 20),
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  child: customText(
                    text: "الكمية",
                    color: Colors.black,
                    fontSize: getResponsiveFont(context, fontSize: 20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'اسم الشركة :',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  getResponsiveFont(context, fontSize: 20))),
                      TextSpan(
                          text: ' ديتول ',
                          style: TextStyle(
                            color: SharedColor.mainColor,
                            fontSize: getResponsiveFont(context, fontSize: 20),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                customText(
                  text: "الكمية",
                  color: Colors.black,
                  fontSize: getResponsiveFont(context, fontSize: 20),
                  fontWeight: FontWeight.bold,
                ),
                QuantityIncrementAddDecrementRowSinglPRoduct(
                  quantity: quntity,
                  incrementFun: () {
                    setState(() {
                      if (quntity < widget.productQuatity) {
                        quntity++;
                      }
                    });
                  },
                  decrementFun: () {
                    if (quntity > 1) {
                      setState(() {
                        quntity--;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                AddToCartButton(
                  onTap: () {
                    BlocProvider.of<AddCartDataCubit>(context).addNote(
                      CartProductData(
                        name: widget.data.data!.name ?? "",
                        price: widget.data.data!.hasDiscount == true
                            ? widget.data.data!.discountPrice
                            : widget.data.data!.price,
                        quality: quntity,
                        productPhoto: widget.data.data!.productPhoto,
                        id: widget.data.data!.id,
                      ),
                    );
                    print("this Product iD ${widget.data.data!.id}");
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
