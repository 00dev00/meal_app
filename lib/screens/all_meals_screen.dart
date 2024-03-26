import 'package:flutter/material.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/screens/meal_list_screen.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:provider/provider.dart';

class AllMealsScreen extends StatelessWidget {
  const AllMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var filtersProvider = context.read<FiltersProvider>();
    var mealService = MealService(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: MealListScreen(
        meals: mealService.getMeal(),
        missingDataText: "It's so empty here (:",
      ),
    );
  }
}
