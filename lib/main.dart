import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:app_widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:github_home_widget/screen/home_screen.dart';

// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
@pragma('vm:entry-point')
void printHello() {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
}

final appWidgetPlugin = AppWidgetPlugin(
  androidPackageName: 'tech.noxasch.app_widget_example',
);
main() async {
  // Be sure to add this line if initialize() call happens before runApp()
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();
  runApp(const MyApp());
  final int helloAlarmID = 0;
  await AndroidAlarmManager.periodic(
      const Duration(minutes: 1), helloAlarmID, printHello);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomeScreen(),
    );
  }
}
