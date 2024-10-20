import 'package:flutter/services.dart';

class BatteryLevel {
  static const platform = MethodChannel('battery');

  Future<String> getBatteryLevel() async {
    try {
      final int batteryLevel = await platform.invokeMethod('getBatteryLevel');
      return 'Battery level is $batteryLevel%.';
    } catch (e) {
      return 'Failed to get battery level: ${e.toString()}';
    }
  }
}
