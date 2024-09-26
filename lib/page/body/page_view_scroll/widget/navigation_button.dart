import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.index,
    required this.containerText,
    required this.onButtonPressed,
  });

  final String containerText;
  final int index;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        backgroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        containerText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
