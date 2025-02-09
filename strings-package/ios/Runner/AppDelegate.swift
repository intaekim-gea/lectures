import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  private var data: [String] = []
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.strings", binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      switch call.method {
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

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
