import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {
  int? visibleDataIndex;
  bool isVisible = false;

  ToggleProvider({this.visibleDataIndex});

  void handleVisibilityChanged(int index) {
    visibleDataIndex = (visibleDataIndex == index) ? null : index;
    notifyListeners();
  }

  void toggleVisibility() {
    if (visibleDataIndex == null) {
      isVisible = false;
    } else {
      isVisible = true;
    }
  }
}
