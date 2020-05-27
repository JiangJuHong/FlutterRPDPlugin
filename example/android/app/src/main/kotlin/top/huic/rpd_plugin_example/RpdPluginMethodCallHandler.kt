package top.huic.rpd_plugin_example

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import top.huic.rpd_plugin.util.CommonUtil

class RpdPluginMethodCallHandler : MethodCallHandler {
    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "testGetParam") {
            this.testGetParam(call, result);
            return;
        }

        result.notImplemented()
    }

    /**
     * 测试强制参数获取
     */
    private fun testGetParam(@NonNull call: MethodCall, @NonNull result: Result) {
        val appid: String = CommonUtil.getParam(call, result, "appid")
        val enabledLogPrint: Boolean = CommonUtil.getParam(call, result, "enabledLogPrint")
        val logPrintLevel: Int = CommonUtil.getParam(call, result, "logPrintLevel")
    }
}
