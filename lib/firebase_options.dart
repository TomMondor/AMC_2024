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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyARWu4NBZQ5a9FTFSX8C-xkjhNUZpWVMKw',
    appId: '1:873965666368:web:fbcd773cf05045cf345fa5',
    messagingSenderId: '873965666368',
    projectId: 'amc-2024-cd83c',
    authDomain: 'amc-2024-cd83c.firebaseapp.com',
    storageBucket: 'amc-2024-cd83c.appspot.com',
    measurementId: 'G-E22HHR3FGV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBO6q-NdnOxv1oZCtcKlw-TvP7mbFDqcQ',
    appId: '1:873965666368:android:02e741cf292dc45b345fa5',
    messagingSenderId: '873965666368',
    projectId: 'amc-2024-cd83c',
    storageBucket: 'amc-2024-cd83c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvqh29wpeBUkMk8fQd0keHOwXcKfA1PHY',
    appId: '1:873965666368:ios:ebfc45a59d503ef2345fa5',
    messagingSenderId: '873965666368',
    projectId: 'amc-2024-cd83c',
    storageBucket: 'amc-2024-cd83c.appspot.com',
    iosBundleId: 'bonne.question.amc2024',
  );
}