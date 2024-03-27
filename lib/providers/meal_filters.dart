import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final class MealFiltersProvider extends ChangeNotifier {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  final Map<MealFilter, ({String name, String desc})> extendedDesc = {
    for (var item in MealFilter.values)
      item: switch (item) {
        MealFilter.isGlutenFree => (
            name: "Gluten-free",
            desc: "Only include gluten-free meals."
          ),
        MealFilter.isLactoseFree => (
            name: "Lactose-free",
            desc: "Only include lactose-free meals."
          ),
        MealFilter.isVegan => (
            name: "Vegan",
            desc: "Only include vegan meals.",
          ),
        MealFilter.isVegetarian => (
            name: "Vegetarian",
            desc: "Only include vegetarian meals.",
          ),
      }
  };

  changeFilter(MealFilter filter) {
    switch (filter) {
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
    notifyListeners();
  }

  Iterable<MealFilter> getActiveFilters() {
    return [
      if (_isGlutenFree) MealFilter.isGlutenFree,
      if (_isLactoseFree) MealFilter.isLactoseFree,
      if (_isVegan) MealFilter.isVegan,
      if (_isVegetarian) MealFilter.isVegetarian,
    ];
  }

  bool getFilter(MealFilter filter) {
    return switch (filter) {
      MealFilter.isGlutenFree => _isGlutenFree,
      MealFilter.isLactoseFree => _isLactoseFree,
      MealFilter.isVegan => _isVegan,
      MealFilter.isVegetarian => _isVegetarian,
    };
  }
}

enum MealFilter {
  isGlutenFree,
  isLactoseFree,
  isVegetarian,
  isVegan,
}
