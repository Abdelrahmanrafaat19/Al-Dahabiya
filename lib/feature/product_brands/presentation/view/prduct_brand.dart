import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/feature/product_brands/presentation/view/widget/product_brands_body.dart';

class ProductBrand extends StatefulWidget {
  final String? title;
  const ProductBrand({super.key, required this.title});

  @override
  State<ProductBrand> createState() => _ProductBrandState();
}

class _ProductBrandState extends State<ProductBrand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        centerTitle: true,
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: responsiveWeidth(context, 30),
          ),
        ),
        title: customText(
          text: widget.title ?? "",
          color: Colors.black,
          fontSize: responsiveWeidth(context, 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const ProductBrandsBody(),
    );
  }
}
