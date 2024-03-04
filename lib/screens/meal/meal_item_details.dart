import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_image.dart';

class MealItemDetails extends StatelessWidget {
  const MealItemDetails(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final mainTextStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white70,
        );
    final lineHeight = mainTextStyle.height! * mainTextStyle.fontSize!;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              meal.title,
            ),
            const Icon(
              Icons.star,
            )
          ],
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
            LimitedBox(
              maxHeight: lineHeight * meal.ingredients.length +
                  20, // IntrinsicHeight is more reasonable way?
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (final ingredient in meal.ingredients)
                      Text(
                        ingredient,
                        style: mainTextStyle,
                      )
                  ]),
            ),
            const Text(
              "Steps",
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepOrangeAccent,
              ),
            ),
            LimitedBox(
              maxHeight: lineHeight * meal.steps.length * 2, // same as above
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (final step in meal.steps)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          textAlign: TextAlign.center,
                          step,
                          style: mainTextStyle,
                        ),
                      )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
