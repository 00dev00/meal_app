import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_item_details.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../widgets/meal_empty.dart';

class MealListScreen extends StatefulWidget {
  const MealListScreen({
    required this.meals,
    this.missingDataText,
    super.key,
  });

  final List<Meal> meals;
  final String? missingDataText;
  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.meals.isNotEmpty
        ? ListView.builder(
            itemCount: widget.meals.length,
            itemBuilder: ((context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealItemDetails(
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
