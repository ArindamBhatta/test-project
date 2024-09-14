import 'package:flutter/material.dart';

class TextButtonHeading extends StatelessWidget {
  const TextButtonHeading({
    super.key,
    required this.containerText,
    required this.buttonBackgroundState,
    required this.onButtonPressed,
  });

  final String containerText;
  final bool buttonBackgroundState;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        backgroundColor: buttonBackgroundState ? Colors.blue[800] : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        containerText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: buttonBackgroundState ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
