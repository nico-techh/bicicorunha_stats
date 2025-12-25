import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;

  void loadStations() {
    isLoading = true;
    notifyListeners();

    // simulamos carga
    Future.delayed(const Duration(seconds: 1), () {
      isLoading = false;
      notifyListeners();
    });
  }
}
