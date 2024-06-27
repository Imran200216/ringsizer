import 'package:flutter/material.dart';
import 'package:ringsizer/constants/colors.dart';

class ProfileListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String titleText;
  final VoidCallback onTap;

  const ProfileListTile({
    super.key,
    required this.leadingIcon,
    required this.titleText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(leadingIcon),
      title: Text(titleText),
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontFamily: "Montserrat",
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
