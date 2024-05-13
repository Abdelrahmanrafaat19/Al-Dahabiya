import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/bloc/section_product_cubit.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/widgets/filter_contatiner.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/widgets/tab_bar.dart';
import '../../../core/scal_factor_method.dart';
import '../../../generated/l10n.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({
    super.key,
  });

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen>
    with SingleTickerProviderStateMixin {
  bool visible = false;
  double sliderValue = 0;
  bool sliderVisible = false;

  late TabController tabController;
  int currentNumber = 0;
  @override
  void initState() {
    BlocProvider.of<SectionProductCubit>(context).getSectionPRoductMethod({
      "cat": catID1,
      "categories": [catID1],
      "brands": [],
      "options": [],
      "price": [price1, 1000],
      "sort": "desc"
      // "paginate":1
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: const TabBarCustam(),
        ),
        centerTitle: true,
        // forceMaterialTransparency: true,
        backgroundColor: const Color.fromARGB(255, 200, 99, 83),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: getResponsiveFont(context, fontSize: 30),
          ),
        ),
        title: customText(
          text: S.of(context).section,
          color: Colors.white,
          fontSize: getResponsiveFont(context, fontSize: 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const FilterContainer(),
    );
  }
}
