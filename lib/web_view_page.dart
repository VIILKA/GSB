import 'package:flutter/material.dart';
import 'package:gsb_new_app/main_menu_view/main_menu_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late WebViewController controller;
  String? url;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadRemoteConfig();
  }

  Future<void> loadRemoteConfig() async {
    setState(() {
      isLoading = true;
    });

    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ));

      await remoteConfig.fetchAndActivate();

      const String key = 'gsb1';

      if (remoteConfig.getAll().containsKey(key)) {
        url = remoteConfig.getString(key);
        print('Ключ найден: $key, значение: $url');
      } else {
        url = null;
        print('Ключ $key не найден.');
      }
    } catch (e) {
      print('Ошибка при загрузке Remote Config: $e');
      url = null;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (url == null || url == 'gsb1') {
      print('Переход на MainMenu, так как url: $url');
      return const MainMenu();
    }

    print('Открытие WebView с URL: $url');
    return SafeArea(
      child: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(url!)),
      ),
    );
  }
}
