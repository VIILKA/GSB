import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gsb_new_app/firebase_options.dart';
import 'package:gsb_new_app/web_view_page.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize('7ee27b33-f5eb-4123-b414-627fb6b2fa8e');
  OneSignal.Notifications.requestPermission(true);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebviewPage(),
    );
  }
}
