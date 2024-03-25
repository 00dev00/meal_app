import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_favorites.dart';
import 'package:meal_app/screens/meal_list.dart';
import 'package:provider/provider.dart';

class FavoriteMealsScreen extends StatelessWidget {
  const FavoriteMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MealListScreen(
      meals: context.watch<FavoriteMealProvider>().favoriteMeal,
      missingDataText: "Add something yummy to your list",
    );
  }
}
