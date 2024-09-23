import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {
  int? unfoldedCardIndex; // Tracks which card is expanded.

  bool isVisible(int index) {
    if (unfoldedCardIndex == index) {
      return true;
    } else {
      return false;
    }
  }

  void toggleVisibility(int index) {
    if (unfoldedCardIndex == index) {
      unfoldedCardIndex = null; // Collapse if same card clicked.
    } else {
      unfoldedCardIndex = index; // Expand if a different card clicked.
    }
    notifyListeners();
  }
}
