import 'package:flutter/material.dart';

class SpecificationProvider extends ChangeNotifier {
  int? unfoldedCardIndex;
  int? tapToChange;
  List<int> cachingList = [];

  void toggleVisibility(int index) {
    if (unfoldedCardIndex == index) {
      //* set to null means no card is active every one is in folded state
      unfoldedCardIndex = null;
    } else {
      //* change to passing argument means current index is active also we needs to store this integer
      unfoldedCardIndex = index;
      cachingList.indexOf(0, index);
    }
    notifyListeners();
  }

  void manageScrollExternally(int index) {
    if (tapToChange == index) {
      //* set to null means no one is active
      tapToChange = null;
    } else {
      //* change to passing argument means current index is active
      tapToChange = index;
    }
    notifyListeners();
  }
}
