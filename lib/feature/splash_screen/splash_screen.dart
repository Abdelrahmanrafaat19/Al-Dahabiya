import 'package:flutter/material.dart';
import 'package:secondwork/core/constant/constant.dart';
import 'package:secondwork/feature/layout/bottom_navigation_bar/presentation/views/bottom_bar_screen.dart';
import 'package:secondwork/feature/login/presentation/view/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      // Use pushReplacement to replace splash screen with the main screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                sharedPreferences!.getString("token")!.isNotEmpty
                    ? const BottomBarScreen()
                    : const LoginScreen()),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.zero,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/core/assestes/spalshscreen.png"),
                fit: BoxFit.fill)),
      ),
    );
  }
}
