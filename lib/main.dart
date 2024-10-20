import 'package:flutter/material.dart';
import 'package:platform_specific_code/services/BatteryLevel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final battery = BatteryLevel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Platform-Specific Code Example')),
        body: Center(
          child: FutureBuilder(
            future: battery.getBatteryLevel(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text(snapshot.data ?? 'Unknown battery level');
              }
            },
          ),
        ),
      ),
    );
  }
}
