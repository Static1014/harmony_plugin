import Flutter
import UIKit

public class HarmonyPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.static4u.harmony_plugin", binaryMessenger: registrar.messenger())
    let instance = HarmonyPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isHarmonyOS":
      result(false)
    case "getHarmonyVersion":
      result("")
    case "isHarmonyPureMode":
      result(false)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
