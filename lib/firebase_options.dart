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
    apiKey: 'AIzaSyA1TPfadB15dAZUpg8kqWlGUmxF0lr1Ux4',
    appId: '1:878112207373:web:fa857ff268075851ff5b44',
    messagingSenderId: '878112207373',
    projectId: 'todolistapp-9da40',
    authDomain: 'todolistapp-9da40.firebaseapp.com',
    storageBucket: 'todolistapp-9da40.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGi7iDc43YKl8MW4Bg3JwLS7Be36z7QrQ',
    appId: '1:878112207373:android:d7916dcaebf09fc9ff5b44',
    messagingSenderId: '878112207373',
    projectId: 'todolistapp-9da40',
    storageBucket: 'todolistapp-9da40.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGeWkYzOkNoqHmUGz4l4ahiLavYN67znE',
    appId: '1:878112207373:ios:261a43dabeb080d3ff5b44',
    messagingSenderId: '878112207373',
    projectId: 'todolistapp-9da40',
    storageBucket: 'todolistapp-9da40.appspot.com',
    iosBundleId: 'com.example.todolistApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGeWkYzOkNoqHmUGz4l4ahiLavYN67znE',
    appId: '1:878112207373:ios:261a43dabeb080d3ff5b44',
    messagingSenderId: '878112207373',
    projectId: 'todolistapp-9da40',
    storageBucket: 'todolistapp-9da40.appspot.com',
    iosBundleId: 'com.example.todolistApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA1TPfadB15dAZUpg8kqWlGUmxF0lr1Ux4',
    appId: '1:878112207373:web:639992087a4f2478ff5b44',
    messagingSenderId: '878112207373',
    projectId: 'todolistapp-9da40',
    authDomain: 'todolistapp-9da40.firebaseapp.com',
    storageBucket: 'todolistapp-9da40.appspot.com',
  );

}