import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/meal_list.dart';

class AllMealsScreen extends StatelessWidget {
  const AllMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: const MealListScreen(
        meals: dummyMeals,
        missingDataText: "It's so empty here (:",
      ),
    );
  }
}
