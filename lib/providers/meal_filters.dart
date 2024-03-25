import 'package:flutter/material.dart';

final class MealFiltersProvider extends ChangeNotifier {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  changeFilter(Map<MealFilter, Object> filterValues) {
    for (var filter in filterValues.entries) {
      switch (filter.key) {
        case MealFilter.isGlutenFree:
          _isGlutenFree = !_isGlutenFree;
          break;
        case MealFilter.isLactoseFree:
          _isLactoseFree = !_isLactoseFree;
          break;
        case MealFilter.isVegetarian:
          _isVegetarian = !_isVegetarian;
          break;
        case MealFilter.isVegan:
          _isVegan = !_isVegan;
          break;
      }
    }
    notifyListeners();
  }

  Map<MealFilter, bool> getFilters() {
    return Map<MealFilter, bool>.fromIterables(MealFilter.values, [
      _isGlutenFree,
      _isLactoseFree,
      _isVegetarian,
      _isVegan,
    ]);
  }
}

enum MealFilter {
  isGlutenFree,
  isLactoseFree,
  isVegetarian,
  isVegan,
}
