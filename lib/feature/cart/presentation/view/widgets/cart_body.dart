import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:secondwork/feature/cart/presentation/bloc/get_cart_data_cubit/get_cart_data_cubit.dart';
import 'package:secondwork/feature/cart/presentation/view/widgets/bottom_container_cart.dart';
import 'package:secondwork/feature/cart/presentation/view/widgets/product_container_cart.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartDataCubit, GetCartDataState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ResponsiveGridList(
                    desiredItemWidth: 410,
                    children: List.generate(
                        GetCartDataCubit.notes.length,
                        (index) => ProductContatinerCart(
                              name: GetCartDataCubit.notes[index].name ?? "",
                              quantity: GetCartDataCubit.notes[index].quality,
                              image:
                                  GetCartDataCubit.notes[index].productPhoto ??
                                      "",
                              price: GetCartDataCubit.notes[index].price ?? 0,
                              increment: () {
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
                              decrement: () {
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
              ),
              BottomContainerCart(
                totalPrice: GetCartDataCubit.totalPrice ?? 0,
                count: GetCartDataCubit.notes.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
