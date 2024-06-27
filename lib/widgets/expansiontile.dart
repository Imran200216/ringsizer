import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringsizer/constants/colors.dart';
import 'package:ringsizer/provider/expnasiontile_provider.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpansionTileProvider>(
      builder: (context, provider, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            // To remove the divider
            cardColor: AppColors.expansionTileBackgroundColor,
            // Background color of the expanded tile
            iconTheme: IconThemeData(color: AppColors.primaryColor),
            // Icon color
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
            title: Text(
              title,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                color: AppColors.onBoardingSubTitleColor,
              ),
            ),
            trailing: Icon(
              provider.isExpanded
                  ? Icons.arrow_circle_up
                  : Icons.arrow_drop_down_circle_sharp,
              color: AppColors.primaryColor,
            ),
            children: <Widget>[child!],
            onExpansionChanged: (bool expanded) {
              provider.toggleExpanded();
            },
          ),
        );
      },
      child: child,
    );
  }
}
