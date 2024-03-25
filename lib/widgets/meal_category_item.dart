import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_list.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    required this.category,
    super.key,
  });
  final Category category;

  void _selectCategory(BuildContext context) {
    var selectedMeals = dummyMeals
        .where(
          (Meal meal) => meal.categories.contains(category.id),
        )
        .toList();
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
