import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal/meal.dart';
import 'package:meal_app/models/meal_category/meal_category.dart';
import 'package:meal_app/providers/meal_filters/meal_filters.dart';

class MealService {
  final List<Meal> meals;
  final Map<MealFilter, bool> mealFilters;
  final List<Meal> favorites;

  MealService({
    this.meals = const [],
    this.mealFilters = const {},
    this.favorites = const [],
  });

  List<Meal> getFilteredMeals() {
    return applyActiveFilters(meals);
  }

  Meal getMeal(String mealId) {
    return getFilteredMeals().firstWhere((Meal meal) => meal.id == mealId);
  }

  List<Meal> getMealsByCategory(String categoryId) {
    return getFilteredMeals()
        .where((Meal meal) => meal.categories.contains(categoryId))
        .toList();
  }

  MealCategory getMealCategory(String categoryId) {
    final allCategories = getMealCategories();

    return allCategories
        .firstWhere((MealCategory category) => category.id == categoryId);
  }

  List<MealCategory> getMealCategories() {
    return availableCategories;
  }

  //#region Favorites
  bool isFavoriteMeal(String mealId) {
    final favoriteMeals = getFavoriteMeals();
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  List<Meal> getFavoriteMeals() {
    List<MealFilter> activeFilters = getActiveFilters();
    if (activeFilters.isEmpty) {
      return favorites;
    }

    return applyActiveFilters(favorites);
  }
  //#endregion Favorites

  //#region Filters
  List<MealFilter> getActiveFilters() {
    return mealFilters.entries
        .where((filter) => filter.value)
        .map((filter) => filter.key)
        .toList();
  }

  List<Meal> applyActiveFilters(
    List<Meal> meals,
  ) {
    final activeFilters = getActiveFilters();

    if (activeFilters.isEmpty) {
      return meals;
    }

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
  //#endregion Filters
}
