import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_image.dart';

class MealItemDetails extends StatelessWidget {
  const MealItemDetails(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    Widget getStepsList() {
      return _getDetailsText(meal.steps, context);
    }

    Widget getIngredientsList() {
      return _getDetailsText(meal.ingredients, context);
    }

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Row(
            children: [
              Text(
                meal.title,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.star_border_outlined,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: MealImage(
                  meal,
                ),
              ),
            ),
            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepOrangeAccent,
              ),
            ),
            getIngredientsList(),
            const Text(
              "Steps",
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepOrangeAccent,
              ),
            ),
            getStepsList()
          ],
        ),
      ),
    );
  }

  Padding _getDetailsText(List<String> rows, BuildContext context) {
    final mainTextStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white70,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10,
      ),
      child: IntrinsicHeight(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (final row in rows)
                Text(
                  textAlign: TextAlign.center,
                  row,
                  style: mainTextStyle,
                )
            ]),
      ),
    );
  }
}
