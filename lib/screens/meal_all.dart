import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meal/meal_main.dart';
import 'package:meal_app/providers/meal_filters/meal_filters.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:meal_app/widgets/meal_list.dart';

class AllMealsScreen extends ConsumerWidget {
  const AllMealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allMeals = ref.watch(mealMainProvider);
    final filters = ref.watch(mealFiltersProvider);
    final mealService = MealService(meals: allMeals, mealFilters: filters);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: MealList(
        meals: mealService.getFilteredMeals(),
        missingDataText: "It's so empty here (:",
      ),
    );
  }
}
