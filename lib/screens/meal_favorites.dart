import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meal_favorites/meal_favorites.dart';
import 'package:meal_app/providers/meal_filters/meal_filters.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:meal_app/widgets/meal_list.dart';

class MealFavoritesScreen extends ConsumerWidget {
  const MealFavoritesScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(mealFavoritesProvider);
    final filters = ref.watch(mealFiltersProvider);
    final mealService = MealService(
      mealFilters: filters,
      favorites: favorites,
    );

    return MealList(
      meals: mealService.getFavoriteMeals(),
      missingDataText: "Add something yummy to your list",
    );
  }
}
