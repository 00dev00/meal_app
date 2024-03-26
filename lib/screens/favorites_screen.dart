import 'package:flutter/material.dart';
import 'package:meal_app/providers/favorites_provider.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/screens/meal_list_screen.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filtersProvider = context.read<FiltersProvider>();
    final mealService = MealService(filtersProvider,
        favoritesProvider: context.watch<FavoritesProvider>());

    return MealListScreen(
      meals: mealService.getFavoriteMeal(),
      missingDataText: "Add something yummy to your list",
    );
  }
}
