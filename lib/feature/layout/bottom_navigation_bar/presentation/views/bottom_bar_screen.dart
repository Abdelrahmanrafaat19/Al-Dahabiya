import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:secondwork/core/theme/color.dart';
import 'package:secondwork/feature/cart/presentation/view/cart_screen.dart';
import 'package:secondwork/feature/home/presentation/view/all_offer_screen.dart';
import 'package:secondwork/feature/home/presentation/view/home.dart';

import 'package:secondwork/feature/profile/presentation/view/profile.dart';
import 'package:secondwork/feature/sectiones_screen/presentation/section_screen.dart';

import '../../../../../generated/l10n.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

List screens = const [
  HomeScreen(),
  AllOfferScreen(),
  CartScreen(),
  SectionScreen(),
  ProfileScreen()
];

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selecteditem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        onTap: (index) {
          setState(() {
            selecteditem = index;
          });
        },
        activeColor: SharedColor.mainColor,
        backgroundColor: SharedColor.whiteColor,
        color: const Color.fromARGB(255, 189, 188, 188),
        style: TabStyle.flip,
        items: [
          TabItem(
            icon: Icons.home,
            title: S.of(context).home,
          ),
          TabItem(
              icon: Icons.favorite_border_outlined, title: S.of(context).offer),
          TabItem(
            icon: Icons.add_shopping_cart_rounded,
            title: S.of(context).cart,
          ),
          TabItem(icon: Icons.table_rows, title: S.of(context).section),
          TabItem(icon: Icons.person, title: S.of(context).profile),
        ],
      ),
      body: screens[selecteditem],
    );
  }
}
