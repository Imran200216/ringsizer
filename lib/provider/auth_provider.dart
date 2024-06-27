import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ringsizer/constants/colors.dart';
import 'package:ringsizer/screens/bottomnav_screen.dart';
import 'package:ringsizer/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? _user;

  User? get user => _user;

  bool _isSigningIn = false;

  bool get isSigningIn => _isSigningIn;

  AuthProvider() {
    _user = _auth.currentUser;
  }

  /// sign in with google authentication
  Future<void> signInWithGoogle(BuildContext context) async {
    _isSigningIn = true;
    notifyListeners();

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _isSigningIn = false;
        notifyListeners();
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      _user = userCredential.user;

      DelightToastBar(
        autoDismiss: true,
        builder: (context) => ToastCard(
          color: AppColors.blackColor,
          leading: Icon(
            Icons.person,
            color: AppColors.whiteColor,
            size: 28,
          ),
          title: Text(
            "Authentication Successful!",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ).show(context);

      /// Save sign-in status to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isSignedIn', true);

      /// Navigate to BottomNav screen if sign-in is successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } catch (e) {
      print("/////////////////////////////////////////////////////");
      print(e);

      DelightToastBar(
        autoDismiss: true,
        builder: (context) => ToastCard(
          color: AppColors.primaryColor,
          leading: Icon(
            Icons.error,
            color: AppColors.whiteColor,
            size: 28,
          ),
          title: Text(
            "Authentication Failed!",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ).show(context);
    } finally {
      _isSigningIn = false;
      notifyListeners();
    }
  }

  /// sign out with google authentication
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      _user = null;
      notifyListeners();

      /// Clear sign-in status from shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('isSignedIn');

      /// Show Delight Toast for successful sign-out
      DelightToastBar(
        autoDismiss: true,
        builder: (context) => ToastCard(
          color: AppColors.blackColor,
          leading: Icon(
            Icons.person,
            color: AppColors.whiteColor,
            size: 28,
          ),
          title: Text(
            "Sign Out Successfully!",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ).show(context);

      /// Navigate to the AuthenticationScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    } catch (e) {
      print(e);

      DelightToastBar(
        autoDismiss: true,
        builder: (context) => ToastCard(
          color: AppColors.primaryColor,
          leading: Icon(
            Icons.error,
            color: AppColors.whiteColor,
            size: 28,
          ),
          title: Text(
            "Sign Out Failed!",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ).show(context);
    }
  }
}
