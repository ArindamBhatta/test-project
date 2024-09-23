import 'package:flutter/material.dart';
import '../../../../../model/model_three.dart';
import '../../../../../repo/repo.dart';

class ToggleProvider extends ChangeNotifier {
  int? visibleDataIndex;
  Future<ModelThree?>? _dataFuture;

  Future<ModelThree?>? get dataFuture => _dataFuture;

  ToggleProvider() {
    fetchData();
  }

  void handleVisibilityChanged(int index) {
    visibleDataIndex = (visibleDataIndex == index) ? null : index;
    notifyListeners();
  }

  // Function to fetch data from API
  Future<void> fetchData() async {
    _dataFuture = Repo.accessSectorsApi();
    notifyListeners();
  }
}
