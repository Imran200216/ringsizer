import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringsizer/constants/colors.dart';
import 'package:ringsizer/provider/auth_provider.dart';
import 'package:ringsizer/screens/faq_screen.dart';
import 'package:ringsizer/widgets/profilelisttile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        /// user is declared to fetch the user image
        final user = authProvider.user;

        if (user == null) {
          /// Show a loading indicator or placeholder when user is null
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        }

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      color: AppColors.primaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// user profile photo
                        Center(
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: user.photoURL != null
                                ? CachedNetworkImageProvider(
                                    user.photoURL!,
                                  )
                                : const CachedNetworkImageProvider(
                                    "https://imgs.search.brave.com/9TilXWEBF8MU39J5Jap7ZYUz902iylBbrogGwQ44D54/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by8zZC1hbmltYXRp/b24tY2hhcmFjdGVy/LWNhcnRvb25fMTEz/MjU1LTEwODQyLmpw/Zz9zaXplPTYyNiZl/eHQ9anBn",
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        /// user text
                        Text(
                          "${user.displayName}",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 18,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        /// Faq
                        ProfileListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FaqScreen()));
                          },
                          leadingIcon: Icons.question_mark,
                          titleText: "FAQ",
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        /// Sign out
                        ProfileListTile(
                          leadingIcon: Icons.logout,
                          titleText: "Sign Out",
                          onTap: () async {
                            /// sign out functionality
                            await authProvider.signOut(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
