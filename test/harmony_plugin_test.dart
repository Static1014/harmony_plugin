import 'package:flutter_test/flutter_test.dart';
import 'package:harmony_plugin/harmony_plugin.dart';
import 'package:harmony_plugin/harmony_plugin_platform_interface.dart';
import 'package:harmony_plugin/harmony_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHarmonyPluginPlatform
    with MockPlatformInterfaceMixin
    implements HarmonyPluginPlatform {

  @override
  Future<String> getHarmonyVersion() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isHarmonyOS() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isHarmonyPureMode() {
    throw UnimplementedError();
  }
}

void main() {
  final HarmonyPluginPlatform initialPlatform = HarmonyPluginPlatform.instance;

  test('$MethodChannelHarmonyPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHarmonyPlugin>());
  });

  test('getPlatformVersion', () async {
    HarmonyPlugin harmonyPlugin = HarmonyPlugin();
    MockHarmonyPluginPlatform fakePlatform = MockHarmonyPluginPlatform();
    HarmonyPluginPlatform.instance = fakePlatform;

    expect(await harmonyPlugin.isHarmonyOS(), false);
  });
}
