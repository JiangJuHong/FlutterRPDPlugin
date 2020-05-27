import UIKit
import Flutter
import rpd_plugin.RpdPlugin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController;
        print(controller.binaryMessenger);
        FlutterMethodChannel(name: "rpd_plugin_example", binaryMessenger: controller as! FlutterBinaryMessenger).setMethodCallHandler(handle);
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "testGetParam" {
            testGetParam(call: call, result: result)
            return;
        }
        result(FlutterMethodNotImplemented);
    }

    /// 测试强制参数获取
    private func testGetParam(call: FlutterMethodCall, result: @escaping FlutterResult) {
//        if let appid = CommonUtil.getParam(call: call, result: result, param: "appid") as? String,
//           let enabledLogPrint = CommonUtil.getParam(call: call, result: result, param: "enabledLogPrint") as? Bool,
//           let logPrintLevel = CommonUtil.getParam(call: call, result: result, param: "logPrintLevel") as? Int {
//            print("我运行成功啦!");
//        }

        result(FlutterError(code: "5", message: "Missing parameter", details: "Cannot find parameter is null!"));
    }
}
