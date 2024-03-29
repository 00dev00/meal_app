import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_filters.dart';
import 'package:meal_app/widgets/meal_list.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:provider/provider.dart';

class AllMealsScreen extends StatelessWidget {
  const AllMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var filtersProvider = context.read<MealFiltersProvider>();
    var mealService = MealService(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: MealList(
        meals: mealService.getMeals(),
        missingDataText: "It's so empty here (:",
      ),
    );
  }
}
