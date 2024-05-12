import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/cart/presentation/bloc/get_cart_data_cubit/get_cart_data_cubit.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/product_shopping_container.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/total_price_row.dart';

class ShoppingCartList extends StatefulWidget {
  const ShoppingCartList({
    super.key,
  });

  @override
  State<ShoppingCartList> createState() => _ShoppingCartListState();
}

class _ShoppingCartListState extends State<ShoppingCartList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartDataCubit, GetCartDataState>(
      builder: (context, state) {
        if (state is GetCartDataIsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: SharedColor.mainColor,
            ),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ResponsiveGridList(
                  scroll: false,
                  shrinkWrap: true,
                  desiredItemWidth: 350,
                  children: List.generate(
                      GetCartDataCubit.notes.length,
                      (index) => ProductShoppingContainer(
                            price: GetCartDataCubit.notes[index].price,
                            name: GetCartDataCubit.notes[index].name ?? "",
                            quatity: GetCartDataCubit.notes[index].quality,
                            incrementfun: () {
                              // ignore: avoid_function_literals_in_foreach_calls
                              GetCartDataCubit.notes.forEach(
                                (element) {
                                  GetCartDataCubit.totalPrice +=
                                      (element.price! *
                                          element.quality.toDouble());
                                },
                              );
                              setState(() {
                                GetCartDataCubit.notes[index].quality++;
                                GetCartDataCubit.notes[index].save();
                                BlocProvider.of<GetCartDataCubit>(context)
                                    .fetchAllNotes();
                              });
                            },
                            deletFun: () {
                              GetCartDataCubit.notes[index].delete();
                              BlocProvider.of<GetCartDataCubit>(context)
                                  .fetchAllNotes();
                            },
                            decrementFunc: () {
                              if (GetCartDataCubit.notes[index].quality > 0) {
                                GetCartDataCubit.notes[index].quality--;
                                GetCartDataCubit.notes[index].save();
                                BlocProvider.of<GetCartDataCubit>(context)
                                    .fetchAllNotes();
                              }
                            },
                          )),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              TotalPriceRow(
                price: GetCartDataCubit.totalPrice,
              ),
            ],
          );
        }
      },
    );
  }
}
