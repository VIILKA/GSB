import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return android;
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhf-hFw_doNGgeu4bq-CCTvKih4gkbde0',
    appId: '1:172801266955:android:2c61579c570e948749be0e',
    messagingSenderId: '172801266955',
    projectId: 'gsb1-17288',
    storageBucket: 'gsb1-17288.firebasestorage.app',
  );
}
