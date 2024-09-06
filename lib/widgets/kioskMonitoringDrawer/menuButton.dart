import 'package:flutter/material.dart';

class menuButton extends StatefulWidget {
  const menuButton({super.key});

  @override
  State<menuButton> createState() => _menuButtonState();
}

class _menuButtonState extends State<menuButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 1,
      right: 8,
      child: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 30.0, // Adjust the icon size here
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: Colors.white, // Icon color
          );
        },
      ),
    );
  }
}
