import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ringsizer/constants/colors.dart';

import 'package:ringsizer/screens/bottomnav_screen.dart';
import 'package:ringsizer/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _checkSignInStatus();
  }

  Future<void> _checkSignInStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isSignedIn = prefs.getBool('isSignedIn') ?? false;

    Timer(
      const Duration(seconds: 3),
      () {
        if (isSignedIn) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => BottomNav()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: AppColors.whiteColor,
        ),
        child: Center(
          child: Text(
            "Ring Sizer",
            style: GoogleFonts.pacifico(
              fontSize: 38,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
