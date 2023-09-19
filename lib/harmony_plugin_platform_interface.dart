import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'harmony_plugin_method_channel.dart';

abstract class HarmonyPluginPlatform extends PlatformInterface {
  /// Constructs a HarmonyPluginPlatform.
  HarmonyPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static HarmonyPluginPlatform _instance = MethodChannelHarmonyPlugin();

  /// The default instance of [HarmonyPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelHarmonyPlugin].
  static HarmonyPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HarmonyPluginPlatform] when
  /// they register themselves.
  static set instance(HarmonyPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
