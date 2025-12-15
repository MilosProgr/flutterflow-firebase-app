import 'package:demoapp/pages/calculator.dart';
import 'package:demoapp/pages/home_page.dart';
import 'package:demoapp/pages/profile_page.dart';
import 'package:demoapp/pages/settings_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // keeps track of pages for bottom navigation
  final List _pages = [
    CounterPage(),
    SettingsPage(),
    ProfilePage(),
    CalculatorPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '1st Page',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      // drawer: Drawer(
      //   backgroundColor: Colors.deepPurple[100],

      //   child: Column(
      //     children: [
      //       DrawerHeader(child: Icon(Icons.favorite, size: 38)),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text("Home"),
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/home');
      //         },
      //       ),

      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text("Settings"),
      //         onTap: () {
      //           Navigator.pushNamed(context, '/settings');
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // body: Center(
      //   // child: Text('Welcome to the First Page!')),
      //   child: ElevatedButton(
      //     child: Text("Idi na sledecu stranicu"),
      //     onPressed: () {
      //       // Navigator.push(
      //       //   context,
      //       //   MaterialPageRoute(builder: (context) => LastPage()),
      //       // );
      //       Navigator.pushNamed(context, '/last');
      //     },
      //   ),
      // ),
    );
  }
}
