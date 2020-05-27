import Flutter
import UIKit

public class SwiftRpdPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "rpd_plugin", binaryMessenger: registrar.messenger())
        let instance = SwiftRpdPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(FlutterMethodNotImplemented);
    }
}
