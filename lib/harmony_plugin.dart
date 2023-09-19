
import 'harmony_plugin_platform_interface.dart';

class HarmonyPlugin {
  Future<String?> getPlatformVersion() {
    return HarmonyPluginPlatform.instance.getPlatformVersion();
  }
}
