// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAu6NywNkla47x9pVm35Ma3nfkLleYLhts',
    appId: '1:656441120853:web:72963d26cb30229a6edcdc',
    messagingSenderId: '656441120853',
    projectId: 'petfindai',
    authDomain: 'petfindai.firebaseapp.com',
    storageBucket: 'petfindai.appspot.com',
    measurementId: 'G-SYXK3PQH66',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBO8iGJB1n8ML97XeAwHrDp4XIopyLROAI',
    appId: '1:656441120853:android:916e1d2be6f36e4c6edcdc',
    messagingSenderId: '656441120853',
    projectId: 'petfindai',
    storageBucket: 'petfindai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBx4AKZLg1K7xDYtdivLt_OlIX8CMogOGg',
    appId: '1:656441120853:ios:79142dbefdf3c8f16edcdc',
    messagingSenderId: '656441120853',
    projectId: 'petfindai',
    storageBucket: 'petfindai.appspot.com',
    iosBundleId: 'com.example.appPetfind',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBx4AKZLg1K7xDYtdivLt_OlIX8CMogOGg',
    appId: '1:656441120853:ios:3d4d53bfa2c458916edcdc',
    messagingSenderId: '656441120853',
    projectId: 'petfindai',
    storageBucket: 'petfindai.appspot.com',
    iosBundleId: 'com.example.appPetfind.RunnerTests',
  );
}