import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealFavoritesProvider extends ChangeNotifier {
  final List<Meal> _favoriteMeal = [];

  late final UnmodifiableListView<Meal> favoriteMeal;

  MealFavoritesProvider() {
    favoriteMeal = UnmodifiableListView(_favoriteMeal);
  }

  bool isFavoriteMeal(Meal mealForCheck) {
    return _favoriteMeal.any((meal) => meal.id == mealForCheck.id);
  }

  addMeal(Meal newMeal) {
    bool alreadyExist = _favoriteMeal.any((meal) => meal.id == newMeal.id);

    if (!alreadyExist) {
      _favoriteMeal.add(newMeal);
      notifyListeners();
    }
  }

  removeMeal(Meal mealToRemove) {
    _favoriteMeal.removeWhere((meal) => meal.id == mealToRemove.id);
    notifyListeners();
  }
}
