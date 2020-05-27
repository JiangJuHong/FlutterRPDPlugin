import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rpd_plugin/rpd_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('rpd_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await RpdPlugin.platformVersion, '42');
  });
}
