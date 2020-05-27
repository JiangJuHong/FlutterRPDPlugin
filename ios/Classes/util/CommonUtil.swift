//
// Created by 蒋具宏 on 2020/5/27.
//

import Foundation
import rpd_plugin.RpdPlugin

/// 通用工具类
public class CommonUtil {
    /// 通用方法，获得参数值，如未找到参数，则直接中断
    public static func getParam(call: FlutterMethodCall, result: @escaping FlutterResult, param: String) -> Any? {
        if let arguments = call.arguments,
           let value = (arguments as! [String: Any])[param] {
            return value
        }
        result(FlutterError(code: "error", message: "Missing parameter", details: "Cannot find parameter `\(param)` or `\(param)` is null!"));
        return nil;
    }
}