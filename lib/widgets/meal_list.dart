import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/models/meal/meal.dart';
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
                  onTap: () {
                    final path = GoRouter.of(context)
                        .routeInformationProvider
                        .value
                        .uri
                        .path;
                    context.go("$path/details/${widget.meals[index].id}");
                  },
                  child: Hero(
                    tag: widget.meals[index].id,
                    child: MealItem(
                      widget.meals[index],
                    ),
                  ),
                )),
          )
        : MealEmptyScreen(
            supplementaryText: widget.missingDataText,
          );
  }
}
