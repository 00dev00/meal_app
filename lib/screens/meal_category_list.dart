import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/meal_category_item.dart';

class MealCategoriesScreen extends StatelessWidget {
  const MealCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double catPadding = 10;
    const double minItemWidth = 150;

    return GridView(
      padding: const EdgeInsets.only(
        left: catPadding,
        right: catPadding,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width ~/ minItemWidth,
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final cat in availableCategories)
          CategoryGridItem(
            category: cat,
          )
      ],
    );
  }
}
