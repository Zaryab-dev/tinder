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
    apiKey: 'AIzaSyD_FT7dlfqk5gCZlSYBFnr9OjF8DiYTEEM',
    appId: '1:818418304811:web:d5d652d53f2fed9363e76e',
    messagingSenderId: '818418304811',
    projectId: 'tinder-b6059',
    authDomain: 'tinder-b6059.firebaseapp.com',
    storageBucket: 'tinder-b6059.appspot.com',
    measurementId: 'G-RB7RR1DNE3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAurqGrEeR82hN1A_yGxyF4tS7dC3-RDG8',
    appId: '1:818418304811:android:94ad56931e4bf8b963e76e',
    messagingSenderId: '818418304811',
    projectId: 'tinder-b6059',
    storageBucket: 'tinder-b6059.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDA6WqlqkILhrxxaE_BLAv7rQ7ZJqbNxoA',
    appId: '1:818418304811:ios:8f1ee69eb3fa0b6a63e76e',
    messagingSenderId: '818418304811',
    projectId: 'tinder-b6059',
    storageBucket: 'tinder-b6059.appspot.com',
    iosBundleId: 'com.tinder.tinder',
  );
}
