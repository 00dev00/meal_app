import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_favorites.dart';
import 'package:meal_app/providers/meal_filters.dart';
import 'package:meal_app/widgets/meal_list.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:provider/provider.dart';

class MealFavoritesScreen extends StatelessWidget {
  const MealFavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final filtersProvider = context.watch<MealFiltersProvider>();
    final mealService = MealService(filtersProvider,
        favoritesProvider: context.watch<MealFavoritesProvider>());

    return MealList(
      meals: mealService.getFavoriteMeal(),
      missingDataText: "Add something yummy to your list",
    );
  }
}
