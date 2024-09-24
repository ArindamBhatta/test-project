import 'package:flutter/material.dart';
// import 'package:home_page/model/model_three.dart';
// import '../../../../../repo/repo.dart';

class ToggleProvider extends ChangeNotifier {
  int? unfoldedCardIndex;

  bool isVisible(int index) {
    if (unfoldedCardIndex == index) {
      return true;
    } else {
      return false;
    }
  }

  void toggleVisibility(int index) {
    if (unfoldedCardIndex == index) {
      unfoldedCardIndex = null;
    } else {
      unfoldedCardIndex = index;
    }
    notifyListeners();
  }
}


/* 
  // Future<ModelThree?>? sectorsData;
  // bool isLoading = false;
  // String errorMessage = '';

// Future<void> fetchSectorsData() async {
  //   try {
  //     isLoading = true;
  //     errorMessage = '';
  //     notifyListeners();

  //     ModelThree? result = await Repo.accessSectorsApi();
  //     if (result != null && result.data != null && result.data!.isNotEmpty) {
  //       print('print one dart value 🙋‍♀️  ${result.data![0].n}');
  //     } else {
  //       print('Data is empty or null');
  //     }
  //   } catch (error) {
  //     errorMessage = 'Error loading data';
  //     throw error;
  //   } finally {
  //     isLoading = false;
  //     print("finally executed");
  //     notifyListeners();
  //   }
  // }

  // Future<ModelThree?>? get getSectorsData {
  //   return sectorsData;
  // }

  // bool get getIsLoading {
  //   return isLoading;
  // }

  // String get getErrorMessage {
  //   return errorMessage;
  // }

 */