import 'package:flutter/material.dart';
import 'package:meal_app/models/category_model.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:meal_app/screens/meal_list_screen.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.category,
    super.key,
  });
  final Category category;

  void _selectCategory(BuildContext context) {
    final filtersProvider = context.read<FiltersProvider>();
    final mealService = MealService(filtersProvider);

    var selectedMeals = mealService.getMealByCategory(category);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(category.title),
          ),
          body: MealListScreen(
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
