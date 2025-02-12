// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBaKqCmKlIzzNb5JzloSIMIRJtuj68_1XA',
    appId: '1:900061710194:web:4663b65f67d8013a64bfeb',
    messagingSenderId: '900061710194',
    projectId: 'ringsizer-b09e2',
    authDomain: 'ringsizer-b09e2.firebaseapp.com',
    storageBucket: 'ringsizer-b09e2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDduScaW5Iv2Q4koxkGYp6P2DyJXhloJb4',
    appId: '1:900061710194:android:774e9739caf0dca964bfeb',
    messagingSenderId: '900061710194',
    projectId: 'ringsizer-b09e2',
    storageBucket: 'ringsizer-b09e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDACh-iaj1Lsj6bA_M9PziieUji5fLs5-s',
    appId: '1:900061710194:ios:0e5302749511de2b64bfeb',
    messagingSenderId: '900061710194',
    projectId: 'ringsizer-b09e2',
    storageBucket: 'ringsizer-b09e2.appspot.com',
    iosBundleId: 'com.example.ringsizer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDACh-iaj1Lsj6bA_M9PziieUji5fLs5-s',
    appId: '1:900061710194:ios:0e5302749511de2b64bfeb',
    messagingSenderId: '900061710194',
    projectId: 'ringsizer-b09e2',
    storageBucket: 'ringsizer-b09e2.appspot.com',
    iosBundleId: 'com.example.ringsizer',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBaKqCmKlIzzNb5JzloSIMIRJtuj68_1XA',
    appId: '1:900061710194:web:1aa0540a51bc821864bfeb',
    messagingSenderId: '900061710194',
    projectId: 'ringsizer-b09e2',
    authDomain: 'ringsizer-b09e2.firebaseapp.com',
    storageBucket: 'ringsizer-b09e2.appspot.com',
  );
}
