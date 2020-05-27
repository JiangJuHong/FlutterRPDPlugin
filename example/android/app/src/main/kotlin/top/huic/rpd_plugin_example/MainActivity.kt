package top.huic.rpd_plugin_example

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(this.flutterEngine!!.dartExecutor, "rpd_plugin_example").setMethodCallHandler(RpdPluginMethodCallHandler())
    }
}
