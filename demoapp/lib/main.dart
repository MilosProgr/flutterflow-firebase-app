import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final double age = 27.5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text("Padding Widget"),
          centerTitle: true,
          backgroundColor: Colors.amber,
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            // color: Colors.deepOrange,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(20),
            ),
            // padding: EdgeInsets.all(20),
            // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
            // padding: EdgeInsets.only(left: 50, top: 10),
            // padding: EdgeInsets.zero,
            // padding: EdgeInsets.all(age.clamp(0, 50)),
            child: Text(
              "John dos ima ${age.toStringAsFixed(1)} years old",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
