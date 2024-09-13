import 'package:flutter/material.dart';

class AllTextHeadingList extends StatelessWidget {
  const AllTextHeadingList({
    super.key,
    required this.containerText,
    required this.buttonBackgroundState,
    required this.onButtonPressed,
    required this.foregroundColor,
  });

  final String containerText;
  final bool buttonBackgroundState;
  final VoidCallback onButtonPressed;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonPressed,
      style: TextButton.styleFrom(
        backgroundColor: buttonBackgroundState ? Colors.blue[800] : null,
        foregroundColor: foregroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        animationDuration: const Duration(milliseconds: 1800),
      ),
      child: Text(
        containerText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: buttonBackgroundState ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
