import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_test/components/box.dart';
import 'package:theme_test/components/button.dart';
import 'package:theme_test/theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: MyBox(
          color: Theme.of(context).colorScheme.primary,
          child: MyButton(
            color: Theme.of(context).colorScheme.secondary,
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).toogleTheme();
            },
          ),
        ),
      ),
    );
  }
}
