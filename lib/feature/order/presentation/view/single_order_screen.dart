import 'package:flutter/material.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/feature/order/data/all_order_model/all_order_sub_field.dart';
import 'package:secondwork/feature/order/presentation/view/widget/single_order_body.dart';
import 'package:secondwork/generated/l10n.dart';

class SingleOrderScreen extends StatefulWidget {
  final dynamic orderNumber,
      date,
      payment,
      status,
      orderPrice,
      shipingPrice,
      total;
  final List<Products> product;
  const SingleOrderScreen({
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
  State<SingleOrderScreen> createState() => _SingleOrderScreenState();
}

class _SingleOrderScreenState extends State<SingleOrderScreen> {
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
          text: S.of(context).orderditals,
          color: Colors.black,
          fontSize: getResponsiveFont(context, fontSize: 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleOrderBody(
        date: widget.date,
        orderNumber: widget.orderNumber,
        orderPrice: widget.orderPrice,
        payment: widget.payment,
        product: widget.product,
        shipingPrice: widget.shipingPrice,
        status: widget.status,
        total: widget.total,
      ),
    );
  }
}
