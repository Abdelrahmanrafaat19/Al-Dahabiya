import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:secondwork/core/componant/custam_buttons.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/cart/data/cart_model/cart_model.dart';
import 'package:secondwork/feature/cart/presentation/bloc/add_cart_data_cubit/add_cart_data_cubit.dart';

import '../../../../../generated/l10n.dart';

class AddToCartButton extends StatelessWidget {
  final dynamic name, price, id, quality, productPhoto;
  const AddToCartButton({
    super.key,
    required this.name,
    required this.price,
    required this.id,
    required this.quality,
    required this.productPhoto,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AddCartDataCubit>(context).addNote(
          CartProductData(
            name: name ?? "",
            price: price,
            quality: 1,
            productPhoto: productPhoto,
            id: id,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: responsiveWeidth(context, 10)),
        child: defaultButton(
          text: S.of(context).addtocart,
          textcolor: SharedColor.whiteColor,
          fontSize: getResponsiveFont(context, fontSize: 30),
          color: SharedColor.orangeColor,
          paddingrl: responsiveWeidth(context, 5),
        ),
      ),
    );
  }
}
