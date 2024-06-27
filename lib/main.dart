import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ringsizer/provider/auth_provider.dart';
import 'package:ringsizer/provider/bottomnav-provider.dart';
import 'package:ringsizer/provider/expnasiontile_provider.dart';
import 'package:ringsizer/screens/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          /// auth provider
          ChangeNotifierProvider(create: (context) => AuthProvider()),

          /// bottom nav provider
          ChangeNotifierProvider(create: (context) => BottomNavProvider()),

          /// expansion tile provider
          ChangeNotifierProvider(create: (context) => ExpansionTileProvider()),
        ],
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
