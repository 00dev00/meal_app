import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal/meal_item.dart';

import 'no_meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isNotEmpty
          ? LayoutBuilder(
              builder: (context, constraints) => ListView.builder(
                itemCount: meals.length,
                itemBuilder: ((context, index) => MealItem(
                      meals[index],
                      constraints,
                    )),
              ),
            )
          : const NoMeal(),
    );
  }
}
