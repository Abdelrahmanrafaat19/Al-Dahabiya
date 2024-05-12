import 'package:flutter/material.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/single_product/presentation/views/widget/single_product_body.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: SharedColor.mainColor,
      body: SingleProductBody(),
    );
  }
}
