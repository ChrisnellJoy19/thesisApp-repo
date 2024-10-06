import 'package:flutter/material.dart';

class AppDrawerButton extends StatefulWidget {
  const AppDrawerButton({super.key});

  @override
  State<AppDrawerButton> createState() => _AppDrawerButtonState();
}

class _AppDrawerButtonState extends State<AppDrawerButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 1,
      right: 8,
      child: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 30.0,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: Colors.white,
          );
        },
      ),
    );
  }
}
