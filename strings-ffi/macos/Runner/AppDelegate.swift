import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  private var data: [String] = []
    
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    let controller: FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.strings", binaryMessenger: controller.engine.binaryMessenger)

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
  }  
}
