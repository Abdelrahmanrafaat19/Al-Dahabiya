import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/feature/home/presentation/view/widgets/all_offer_body.dart';
import 'package:secondwork/generated/l10n.dart';

class AllOfferScreen extends StatefulWidget {
  const AllOfferScreen({super.key});

  @override
  State<AllOfferScreen> createState() => _AllOfferScreenState();
}

class _AllOfferScreenState extends State<AllOfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        toolbarHeight: 50.h,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: responsiveWeidth(context, 30),
          ),
        ),
        title: customText(
          text: S.of(context).alloffers,
          color: Colors.black,
          fontSize: responsiveWeidth(context, 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const AllOfferBody(),
    );
  }
}
