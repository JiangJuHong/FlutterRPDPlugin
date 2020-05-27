import 'dart:async';

import 'package:flutter/services.dart';

class RpdPluginExample {
  static const MethodChannel _channel = const MethodChannel('rpd_plugin_example');

  /// 测试强制参数获取
  static Future<void> testGetParam() async {
    return await _channel.invokeMethod('testGetParam');
  }
}