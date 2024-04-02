import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal/meal.dart';
import 'package:meal_app/models/meal_category/meal_category.dart';
import 'package:meal_app/providers/meal/meal_main.dart';
import 'package:meal_app/providers/meal_filters/meal_filters.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:meal_app/widgets/meal_list.dart';

class MealsByCategoryScreen extends ConsumerWidget {
  const MealsByCategoryScreen({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Meal> meals = ref.watch(mealMainProvider);
    Map<MealFilter, bool> filters = ref.watch(mealFiltersProvider);

    MealService mealService = MealService(
      meals: meals,
      mealFilters: filters,
    );
    MealCategory category = mealService.getMealCategory(categoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: MealList(meals: mealService.getMealsByCategory(categoryId)),
    );
  }
}
