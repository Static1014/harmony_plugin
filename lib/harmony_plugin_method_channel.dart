import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'harmony_plugin_platform_interface.dart';

/// An implementation of [HarmonyPluginPlatform] that uses method channels.
class MethodChannelHarmonyPlugin extends HarmonyPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('harmony_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
