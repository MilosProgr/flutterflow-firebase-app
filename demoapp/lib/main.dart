import 'package:demoapp/pages/first_page.dart';
import 'package:demoapp/pages/home_page.dart';
import 'package:demoapp/pages/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/firstPage': (context) => FirstPage(),
        '/home': (context) => CounterPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
