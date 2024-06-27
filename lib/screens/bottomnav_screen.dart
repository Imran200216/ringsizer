import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringsizer/constants/colors.dart';
import 'package:ringsizer/provider/bottomnav-provider.dart';
import 'package:ringsizer/screens/home_screen.dart';
import 'package:ringsizer/screens/profile_screen.dart';

class BottomNav extends StatelessWidget {
   BottomNav({super.key});


  /// Bottom navigation bar screens
  final widgetList = [
    /// Home Screen
    const HomeScreen(),

    /// Vehicle Screen
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, bottomNavProvider, child) {
        return Scaffold(

          /// bottom navigation bar
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              bottomNavProvider.setIndex(index);
            },
            currentIndex: bottomNavProvider.currentIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedLabelStyle: const TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
            ),
            selectedLabelStyle: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile",
              ),
            ],
          ),
          body: widgetList[bottomNavProvider.currentIndex],
        );
      },
    );
  }
}
