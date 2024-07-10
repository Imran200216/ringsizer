import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringsizer/constants/colors.dart';
import 'package:ringsizer/modals/faq_items.dart';
import 'package:ringsizer/provider/expnasiontile_provider.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of FAQ items
    final List<FaqItem> faqItems = [
      FaqItem(
        title: "What is a Ring Sizer?",
        subtitle: "Learn about ring sizers",
        content: "A ring sizer is a tool used to measure the size of a ring to ensure a proper fit.",
      ),
      FaqItem(
        title: "How to Use a Ring Sizer?",
        subtitle: "Steps to use a ring sizer",
        content: "To use a ring sizer, simply slide the ring onto the sizer or wrap the sizer around your finger to measure.",
      ),
      FaqItem(
        title: "Digital Ring Sizers",
        subtitle: "Advantages of digital ring sizers",
        content: "Digital ring sizers provide precise measurements and can be used for both online and offline shopping.",
      ),
      FaqItem(
        title: "Material Types",
        subtitle: "Different materials of ring sizers",
        content: "Ring sizers can be made from plastic, metal, or even paper for disposable use.",
      ),
      FaqItem(
        title: "Ring Sizer Apps",
        subtitle: "Benefits of using ring sizer apps",
        content: "Ring sizer apps use your phone's camera to measure your ring size, providing convenience and accuracy.",
      ),
      FaqItem(
        title: "Accuracy Tips",
        subtitle: "Tips to ensure accurate measurements",
        content: "Measure your finger size at the end of the day and ensure your hands are warm for the most accurate results.",
      ),
      FaqItem(
        title: "International Ring Sizes",
        subtitle: "Understanding ring size standards",
        content: "Ring sizes can vary between countries, so it's important to know the international size chart for accurate sizing.",
      ),
      FaqItem(
        title: "Adjustable Ring Sizer",
        subtitle: "Benefits of adjustable ring sizer",
        content: "Adjustable ring sizer can fit a range of sizes, making them versatile for measuring different fingers.",
      ),
      FaqItem(
        title: "Online Shopping",
        subtitle: "Using ring sizers for online purchases",
        content: "Ring sizer apps and tools help ensure you purchase the correct size when shopping for rings online.",
      ),
      FaqItem(
        title: "Professional Jewelers",
        subtitle: "Consulting with professional jewelers",
        content: "For the most accurate sizing, consult with a professional jeweler who can use high-quality tools to measure your ring size.",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
        title: const Text("Cool FAQ's"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "Montserrat",
          color: AppColors.blackColor,
          fontSize: 20,
        ),
      ),
      body: Consumer<FaqProvider>(
        builder: (context, faqProvider, child) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: ListView.builder(
              itemCount: faqItems.length,
              itemBuilder: (context, index) {
                final item = faqItems[index];
                return Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                    cardColor: AppColors.expansionTileBackgroundColor,
                    iconTheme: IconThemeData(color: AppColors.primaryColor),
                    textTheme: TextTheme(
                      titleMedium: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                      titleSmall: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        color: AppColors.onBoardingSubTitleColor,
                      ),
                    ),
                  ),
                  child: ExpansionTile(
                    key: UniqueKey(),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                    subtitle: Text(
                      item.subtitle,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        color: AppColors.onBoardingSubTitleColor,
                      ),
                    ),
                    onExpansionChanged: (bool expanded) {
                      faqProvider.setExpandedIndex(expanded ? index : -1);
                    },
                    initiallyExpanded: faqProvider.expandedIndex == index,
                    children: <Widget>[
                      ListTile(
                        title: Text(item.content),
                        titleTextStyle: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          color: AppColors.onBoardingSubTitleColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
