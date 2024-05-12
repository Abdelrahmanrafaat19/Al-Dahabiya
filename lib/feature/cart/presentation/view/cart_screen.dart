import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/cart/presentation/bloc/get_cart_data_cubit/get_cart_data_cubit.dart';
import 'package:secondwork/feature/cart/presentation/view/widgets/cart_body.dart';

import '../../../../core/scal_factor_method.dart';
import '../../../../generated/l10n.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<GetCartDataCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 217, 217),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 40.h,
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back,
          size: getResponsiveFont(context, fontSize: 30),
        ),
        title: customText(
          text: S.of(context).mycart,
          color: Colors.black,
          fontSize: getResponsiveFont(context, fontSize: 20),
          fontWeight: FontWeight.bold,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: const CircleAvatar(
              backgroundColor: SharedColor.mainColor,
              child: Icon(
                Icons.location_on_outlined,
                color: SharedColor.whiteColor,
              ),
            ),
          )
        ],
      ),
      body: const CartBody(),
    );
  }
}
