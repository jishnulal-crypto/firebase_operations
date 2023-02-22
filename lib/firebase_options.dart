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
    apiKey: 'AIzaSyAmmmjudRYTHQIqpajXri9FfP0Acab4E8Q',
    appId: '1:432779098648:web:a95e6158952e43d44f616d',
    messagingSenderId: '432779098648',
    projectId: 'operations-42934',
    authDomain: 'operations-42934.firebaseapp.com',
    storageBucket: 'operations-42934.appspot.com',
    measurementId: 'G-TNK2P1VNDH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCOUvTnTdHMTCOQG39R-3VEJhsilWt0Pc',
    appId: '1:432779098648:android:ebb39ab5a528c2c34f616d',
    messagingSenderId: '432779098648',
    projectId: 'operations-42934',
    storageBucket: 'operations-42934.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLvyNQXlj_irodm5jtxVNmvy1z2Y-D2KA',
    appId: '1:432779098648:ios:ac91a9e3d3a0345d4f616d',
    messagingSenderId: '432779098648',
    projectId: 'operations-42934',
    storageBucket: 'operations-42934.appspot.com',
    iosClientId: '432779098648-d88j289ga0bpsbfr29mj81707sci3tvn.apps.googleusercontent.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLvyNQXlj_irodm5jtxVNmvy1z2Y-D2KA',
    appId: '1:432779098648:ios:ac91a9e3d3a0345d4f616d',
    messagingSenderId: '432779098648',
    projectId: 'operations-42934',
    storageBucket: 'operations-42934.appspot.com',
    iosClientId: '432779098648-d88j289ga0bpsbfr29mj81707sci3tvn.apps.googleusercontent.com',
    iosBundleId: 'com.example.project',
  );
}
