import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/feature/order/presentation/bloc/all_order_cubit.dart';
import 'package:secondwork/feature/order/presentation/view/widget/all_orders_body.dart';
import 'package:secondwork/generated/l10n.dart';

class AllOrderScreen extends StatefulWidget {
  const AllOrderScreen({super.key});

  @override
  State<AllOrderScreen> createState() => _AllOrderScreenState();
}

class _AllOrderScreenState extends State<AllOrderScreen> {
  @override
  void initState() {
    BlocProvider.of<AllOrderCubit>(context).getAllOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          text: S.of(context).order,
          color: Colors.black,
          fontSize: getResponsiveFont(context, fontSize: 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const AllOrdersBody(),
    );
  }
}
