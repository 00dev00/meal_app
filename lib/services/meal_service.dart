import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/models/meal_category.dart';
import 'package:meal_app/providers/meal_favorites.dart';
import 'package:meal_app/providers/meal_filters.dart';

class MealService {
  final MealFiltersProvider filtersProvider;
  final MealFavoritesProvider? favoritesProvider;

  MealService(this.filtersProvider, {this.favoritesProvider});

  List<Meal> getMeals() {
    var activeFilters = filtersProvider.getActiveFilters();

    if (activeFilters.isEmpty) {
      return dummyMeals;
    }

    return _applyActiveFilters(dummyMeals, activeFilters);
  }

  Meal getMeal(String mealId) {
    var meals = getMeals();

    return meals.firstWhere((Meal meal) => meal.id == mealId);
  }

  List<Meal> getMealsByCategory(String categoryId) {
    var meals = getMeals();

    return meals
        .where((Meal meal) => meal.categories.contains(categoryId))
        .toList();
  }

  List<Meal> getFavoriteMeal() {
    if (favoritesProvider != null) {
      var activeFilters = filtersProvider.getActiveFilters();

      if (activeFilters.isEmpty) {
        return favoritesProvider!.favoriteMeal;
      }

      return _applyActiveFilters(
          favoritesProvider!.favoriteMeal, activeFilters);
    }

    return List.empty();
  }

  List<MealCategory> getMealCategories() {
    return availableCategories;
  }

  MealCategory getMealCategory(String categoryId) {
    var allCategories = getMealCategories();

    return allCategories
        .firstWhere((MealCategory category) => category.id == categoryId);
  }

  List<Meal> _applyActiveFilters(
    List<Meal> meals,
    Iterable<MealFilter> activeFilters,
  ) {
    return meals.where((Meal meal) {
      for (MealFilter mealFilter in activeFilters) {
        switch (mealFilter) {
          case MealFilter.isGlutenFree:
            if (!meal.isGlutenFree) return false;
          case MealFilter.isLactoseFree:
            if (!meal.isLactoseFree) return false;
          case MealFilter.isVegan:
            if (!meal.isGlutenFree) return false;
          case MealFilter.isVegetarian:
            if (!meal.isGlutenFree) return false;
        }
      }
      return true;
    }).toList();
  }
}
