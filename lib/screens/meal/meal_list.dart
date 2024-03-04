import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal/meal_item.dart';
import 'meal_empty_screen.dart';

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
              builder: (context, constraints) => constraints.maxWidth > 600
                  ? GridView.count(
                      crossAxisCount: constraints.maxWidth > 1000 ? 4 : 3,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: meals
                          .map((Meal meal) => MealItem(meal, constraints))
                          .toList(),
                    )
                  : ListView.builder(
                      itemCount: meals.length,
                      itemBuilder: ((context, index) => MealItem(
                            meals[index],
                            constraints,
                          )),
                    ),
            )
          : const MealEmptyScreen(),
    );
  }
}
