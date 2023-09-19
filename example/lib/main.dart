import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harmony_plugin/harmony_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isHarmony = false;
  bool _isPureMode = false;
  String _harmonyVersion = '';
  final _harmonyPlugin = HarmonyPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    bool isHarmony;
    bool isPureMode;
    String harmonyVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      isHarmony = await _harmonyPlugin.isHarmonyOS();
      harmonyVersion = await _harmonyPlugin.getHarmonyVersion();
      isPureMode = await _harmonyPlugin.isHarmonyPureMode();
    } on PlatformException {
      isHarmony = false;
      harmonyVersion = '';
      isPureMode = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isHarmony = isHarmony;
      _harmonyVersion = harmonyVersion;
      _isPureMode = isPureMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Harmony Plugin example'),
        ),
        body: Center(
          child: Text('is harmony os: $_isHarmony\nharmony version: $_harmonyVersion\npure mode: $_isPureMode'),
        ),
      ),
    );
  }
}
