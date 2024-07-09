import 'package:flutter/material.dart';

class FaqProvider with ChangeNotifier {
  int _expandedIndex = -1;

  int get expandedIndex => _expandedIndex;

  void setExpandedIndex(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = -1;
    } else {
      _expandedIndex = index;
    }
    notifyListeners();
  }
}
