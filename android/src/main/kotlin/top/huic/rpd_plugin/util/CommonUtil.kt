package top.huic.rpd_plugin.util

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


/**
 * 通用工具类
 * @author蒋具宏
 */
class CommonUtil {
    companion object {
        /**
         * 通用方法，获得参数值，如未找到参数，则直接中断
         *
         * @param methodCall 方法调用对象
         * @param result     返回对象
         * @param param      参数名
         */
        fun <T> getParam(methodCall: MethodCall, result: MethodChannel.Result, param: String): T {
            return methodCall.argument(param) ?: throw RuntimeException("Cannot find parameter `$param` or `$param` is null!")
        }
    }
}