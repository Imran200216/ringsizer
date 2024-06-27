import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringsizer/constants/colors.dart';

class OnBoarding extends StatelessWidget {
  final String urlImage;
  final String onBoardingTitle;
  final String onBoardingSubtitle;

  const OnBoarding({
    super.key,
    required this.urlImage,
    required this.onBoardingTitle,
    required this.onBoardingSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: AppColors.whiteColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              urlImage,
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              onBoardingTitle,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: AppColors.onBoardingTitleColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                textAlign: TextAlign.center,
                onBoardingSubtitle,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.onBoardingSubTitleColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
