import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'harmony_plugin_platform_interface.dart';

/// An implementation of [HarmonyPluginPlatform] that uses method channels.
class MethodChannelHarmonyPlugin extends HarmonyPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.static4u.harmony_plugin');

  @override
  Future<bool> isHarmonyOS() async {
    bool? isHarmony = await methodChannel.invokeMethod<bool>('isHarmonyOS');
    return isHarmony ?? false;
  }

  @override
  Future<String> getHarmonyVersion() async {
    String? version = await methodChannel.invokeMethod<String>('getHarmonyVersion');
    return version ?? '';
  }

  @override
  Future<bool> isHarmonyPureMode() async {
    bool? isPure = await methodChannel.invokeMethod<bool>('isHarmonyPureMode');
    return isPure ?? false;
  }
}
