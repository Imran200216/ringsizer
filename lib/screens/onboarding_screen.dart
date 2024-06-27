import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:ringsizer/constants/colors.dart';
import 'package:ringsizer/provider/auth_provider.dart';

import 'package:ringsizer/widgets/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Container(
            padding: const EdgeInsets.only(
              bottom: 80,
            ),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                });
              },
              children: const [
                OnBoarding(
                  urlImage: "assets/images/svg/onboarding-img1.svg",
                  onBoardingTitle: "Ring Sizer",
                  onBoardingSubtitle:
                      "Find your perfect fit - No more ring-a-ding-dong!",
                ),
                OnBoarding(
                  urlImage: "assets/images/svg/onboarding-img2.svg",
                  onBoardingTitle: "Ring Sizer",
                  onBoardingSubtitle:
                      "Say 'yes' to the perfect size! Download our ring sizer app!",
                ),
                OnBoarding(
                  urlImage: "assets/images/svg/onboarding-img3.svg",
                  onBoardingTitle: "Ring Sizer",
                  onBoardingSubtitle:
                      "Love is in the air... and hopefully on your finger! Get sized with our app!",
                ),
              ],
            ),
          ),
          bottomSheet: isLastPage
              ? TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.whiteColor,
                    backgroundColor: AppColors.primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    minimumSize: const Size.fromHeight(80),
                  ),
                  onPressed: () {
                    /// Sign in with google functionality
                    authProvider.signInWithGoogle(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/svg/google-auth.svg",
                        height: 34,
                        width: 34,
                        color: AppColors.whiteColor,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Let's Sign In with Google",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            color: AppColors.onBoardingSubTitleColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: ExpandingDotsEffect(
                            spacing: 10,
                            dotColor: Colors.grey.shade300,
                            activeDotColor: AppColors.primaryColor,
                          ),
                          onDotClicked: (index) {
                            controller.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            color: AppColors.onBoardingSubTitleColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
