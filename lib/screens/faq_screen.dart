import 'package:flutter/material.dart';
import 'package:ringsizer/constants/colors.dart';
import 'package:ringsizer/widgets/expansiontile.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: AppColors.primaryColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Any Cool FAQ's",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomExpansionTile(
                title: 'About Ring Sizer App',
                subtitle: 'Features',
                child: ListTile(
                  title: Text(
                    'Visualize Ring Sizes:\nSee exactly how different ring sizes will look on your finger. Use the interactive slider to adjust the size and watch the ring size update in real-time on the screen.',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomExpansionTile(
                title: 'Benefits of Ring Sizer',
                subtitle: 'Main Goal',
                child: ListTile(
                  title: Text(
                    'Detailed Information:\nGet more than just a size number. The app provides comprehensive details about the selected ring size, including its radius, diameter, and circumference. This allows you to compare sizes effectively and ensure a perfect fit.',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
