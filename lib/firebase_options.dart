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
    apiKey: 'AIzaSyCK4hxY4KnKHDQ91CGFUpr15jUn9xelfJY',
    appId: '1:389779620365:web:398d66fb31b4bc56650b44',
    messagingSenderId: '389779620365',
    projectId: 'chatty-7f79c',
    authDomain: 'chatty-7f79c.firebaseapp.com',
    storageBucket: 'chatty-7f79c.appspot.com',
    measurementId: 'G-HHQT8SHYBN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApFYoUqm4SuTmbELFqaqZZ6p8yhxOxISg',
    appId: '1:389779620365:android:a1bc8507bb934242650b44',
    messagingSenderId: '389779620365',
    projectId: 'chatty-7f79c',
    storageBucket: 'chatty-7f79c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUcBr46mg6a8yoIgnsZa4TUrk6eDB5wzE',
    appId: '1:389779620365:ios:fd160565ee5388e3650b44',
    messagingSenderId: '389779620365',
    projectId: 'chatty-7f79c',
    storageBucket: 'chatty-7f79c.appspot.com',
    iosClientId: '389779620365-cdp1a20h68cjmmrnjqm7dr5gvgfu214c.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUcBr46mg6a8yoIgnsZa4TUrk6eDB5wzE',
    appId: '1:389779620365:ios:45463daf7542ee38650b44',
    messagingSenderId: '389779620365',
    projectId: 'chatty-7f79c',
    storageBucket: 'chatty-7f79c.appspot.com',
    iosClientId: '389779620365-2cnsk8a93p635o0a2qai8lg6qjlrgst9.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
