import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_category.dart';
import 'package:meal_app/providers/meal_filters.dart';
import 'package:meal_app/widgets/meal_list.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:provider/provider.dart';

class MealCategoryItem extends StatelessWidget {
  const MealCategoryItem({
    required this.category,
    super.key,
  });
  final MealCategory category;

  void _selectCategory(BuildContext context) {
    final filtersProvider = context.read<MealFiltersProvider>();
    final mealService = MealService(filtersProvider);

    var selectedMeals = mealService.getMealByCategory(category);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(category.title),
          ),
          body: MealList(
            meals: selectedMeals,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            )),
        child: Center(
          child: Text(
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
            category.title,
          ),
        ),
      ),
    );
  }
}
