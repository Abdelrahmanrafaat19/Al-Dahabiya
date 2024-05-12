import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/cart/data/cart_model/cart_model.dart';
import 'package:secondwork/feature/cart/presentation/bloc/get_cart_data_cubit/get_cart_data_cubit.dart';
import 'package:secondwork/feature/shoping/presentation/bloc/cubit/shopping_cubit.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/address_shopping_list.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/confirm_order_button.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/delivery_time_field.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/notes_field.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/payment_method_row.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/promo_code_fied.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/shoping_cart_list.dart';

import '../../../../layout/bottom_navigation_bar/presentation/views/bottom_bar_screen.dart';

class ShoppingBody extends StatefulWidget {
  const ShoppingBody({super.key});

  @override
  State<ShoppingBody> createState() => _ShoppingBodyState();
}

class _ShoppingBodyState extends State<ShoppingBody> {
  final SingleValueDropDownController deliveryController =
      SingleValueDropDownController();
  TextEditingController noteController = TextEditingController();
  TextEditingController promoCodeController = TextEditingController();
  dynamic addresss = "";
  String gro = 'yes';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCubit, ShoppingState>(
      listener: (context, state) {
        if (state is ShoppingIsLoading) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                  width: responsiveWeidth(context, 100),
                  height: 100.h,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: SharedColor.mainColor,
                  ))),
            ),
          );
        } else if (state is ShoppingSuccess) {
          Navigator.pop(context);
          if (state.data["code"] == 200) {
            Hive.box<CartProductData>("cart_box").clear();
            // ignore: avoid_function_literals_in_foreach_calls

            Navigator.of(context).pushAndRemoveUntil(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const BottomBarScreen(),
                ),
                (route) => false);
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: SizedBox(
                  width: responsiveWeidth(context, 100),
                  height: 100.h,
                  child: Center(
                    child: customText(
                      text: state.data["message"],
                      color: SharedColor.mainColor,
                      fontSize: getResponsiveFont(context, fontSize: 15),
                    ),
                  ),
                ),
              ),
            );
          }
        } else if (state is ShoppingFailure) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: Center(child: Text("${state.maessge}"))),
            ),
          );
        }
      },
      builder: (context, state) {
        if (GetCartDataCubit.notes.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWeidth(
                context,
                10,
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ShoppingCartList(),
                    SizedBox(
                      height: 20.h,
                    ),
                    const PaymentMethodRow(),
                    SizedBox(
                      height: 10.h,
                    ),
                    AddressShoppingList(
                      address: addresss,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DeliveryTimeField(
                      controller: deliveryController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    NotesField(
                      controller: noteController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PromoCodeField(
                      controller: promoCodeController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ConfirmOrderButton(
                      ontap: () {
                        BlocProvider.of<ShoppingCubit>(context).shoppingMethod({
                          "address": 9,
                          "coupon": promoCodeController.text,
                          "payment_type": "الدفع عند الاستلام",
                          "delivery_time":
                              deliveryController.dropDownValue!.name,
                          "comment": "comment",
                          "points": 0,
                          "data": GetCartDataCubit.data
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
