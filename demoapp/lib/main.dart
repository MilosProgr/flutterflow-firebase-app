import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  int age = 27;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(backgroundColor: Colors.deepPurple));
  }
}
