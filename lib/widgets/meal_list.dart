import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../screens/meal_empty.dart';

class MealList extends StatefulWidget {
  const MealList({
    required this.meals,
    this.missingDataText,
    super.key,
  });

  final List<Meal> meals;
  final String? missingDataText;
  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  @override
  Widget build(BuildContext context) {
    return widget.meals.isNotEmpty
        ? ListView.builder(
            itemCount: widget.meals.length,
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealDetailsScreen(
                        widget.meals[index],
                      ),
                    ),
                  ),
                  child: MealItem(
                    widget.meals[index],
                  ),
                )),
          )
        : MealEmptyScreen(
            supplementaryText: widget.missingDataText,
          );
  }
}
