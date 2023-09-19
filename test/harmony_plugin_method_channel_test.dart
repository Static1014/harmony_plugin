import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harmony_plugin/harmony_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelHarmonyPlugin platform = MethodChannelHarmonyPlugin();
  const MethodChannel channel = MethodChannel('com.static4u.harmony_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return false;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });
}
