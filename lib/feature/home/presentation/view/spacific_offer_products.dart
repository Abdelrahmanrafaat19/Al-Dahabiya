import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/feature/home/presentation/view/widgets/offer_products.dart';

import '../../../../core/method.dart';

class OfferProducts extends StatelessWidget {
  final String title;
  const OfferProducts({super.key, required this.title});

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
          text: title,
          color: Colors.black,
          fontSize: responsiveWeidth(context, 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const OfferProductsBody(),
    );
  }
}
