import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_filters.dart';
import 'package:meal_app/widgets/meal_list.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:provider/provider.dart';

class MealsByCategoryScreen extends StatelessWidget {
  const MealsByCategoryScreen({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final filtersProvider = context.read<MealFiltersProvider>();
    final mealService = MealService(filtersProvider);
    final category = mealService.getMealCategory(categoryId);

    var selectedMeals = mealService.getMealsByCategory(categoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: MealList(meals: selectedMeals),
    );
  }
}
