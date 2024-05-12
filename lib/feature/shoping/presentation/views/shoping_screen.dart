import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/feature/cart/presentation/bloc/get_cart_data_cubit/get_cart_data_cubit.dart';
import 'package:secondwork/feature/shoping/presentation/views/widget/shopping_body.dart';

import '../../../../core/scal_factor_method.dart';
import '../../../../generated/l10n.dart';

class ShopingScreen extends StatefulWidget {
  const ShopingScreen({super.key});

  @override
  State<ShopingScreen> createState() => _ShopingScreenState();
}

class _ShopingScreenState extends State<ShopingScreen> {
  @override
  void initState() {
    BlocProvider.of<GetCartDataCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.h,
        forceMaterialTransparency: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: getResponsiveFont(context, fontSize: 30),
          ),
        ),
        centerTitle: true,
        title: customText(
          text: S.of(context).shopping,
          color: Colors.black,
          fontSize: getResponsiveFont(context, fontSize: 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const ShoppingBody(),
    );
  }
}
