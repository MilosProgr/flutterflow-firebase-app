import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbBar extends StatelessWidget {
  void Function(int)? onTabChange;

  MyBottomNavbBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GNav(
          color: Colors.grey[400],
          activeColor: Colors.grey.shade700,
          tabBackgroundColor: Colors.grey.shade300,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          tabBorderRadius: 16,
          gap: 8,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.shopping_bag, text: 'Cart'),
            GButton(icon: Icons.favorite, text: 'Favorites'),
            GButton(icon: Icons.person, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
