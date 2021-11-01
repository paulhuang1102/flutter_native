import UIKit
import Flutter


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    
      FLTSearchApiSetup(controller.binaryMessenger, SwiftPigeonService())

      
      
      let helloChannel = FlutterMethodChannel(name: "flutter.native/helper", binaryMessenger: controller.binaryMessenger)
  
      helloChannel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
  
        // Note: this methhod is invoked in the UI thread
        guard call.method == "helloFromNativeCode" else {
          result(FlutterMethodNotImplemented)
          return
        }
  
        result(self?.helloFromNativeCode())
      })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)

    
  }

  private func helloFromNativeCode() -> String {
    return "Hello from Native iOS Code"
  }
}
