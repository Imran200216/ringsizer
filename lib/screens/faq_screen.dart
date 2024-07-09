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
        title: "Question 1",
        subtitle: "Answer to question 1",
        content: "Hi im content",
      ),
      FaqItem(
        title: "Question 2",
        subtitle: "Answer to question 2",
        content: "Hi im a content",
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
              itemCount: 2,
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
                          fontWeight: FontWeight.w600,
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
