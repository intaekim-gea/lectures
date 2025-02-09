import Flutter
import UIKit

public class StringServicePlugin: NSObject, FlutterPlugin {
  private var data: [String] = []

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "string_service_plugin", binaryMessenger: registrar.messenger())
    let instance = StringServicePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "retrieveAllData":
      result(self.data)
    case "addString":
      if let args = call.arguments as? [String: Any], let newString = args["newString"] as? String {
        self.data.append(newString)
        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "String is null", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
