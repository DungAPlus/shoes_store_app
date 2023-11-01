import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

class SearchMode extends ChangeNotifier {
  String _searchText = '';
  bool isFocused = false;
  int _brandSelected = -1;

  String get searchText => _searchText;
  int get brandSelected => _brandSelected;

  void setSearchText(String newText) {
    _searchText = newText;
    notifyListeners();
  }

  void setBrandSelected(int newBrandIndex) {
    _brandSelected = newBrandIndex;
    notifyListeners();
  }

  void resetBrand() {
    _brandSelected = -1;
    notifyListeners();
  }

  void onSearchChangeFocus(bool state) {
    isFocused = state;
    notifyListeners();
  }
}

SearchMode searchMode = SearchMode();
