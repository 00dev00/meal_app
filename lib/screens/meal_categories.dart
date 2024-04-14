import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/meal_category_item.dart';

class MealCategoriesScreen extends StatefulWidget {
  const MealCategoriesScreen({super.key});

  @override
  State<MealCategoriesScreen> createState() => _MealCategoriesScreenState();
}

class _MealCategoriesScreenState extends State<MealCategoriesScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Durations.long1,
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double catPadding = 10;
    const double minItemWidth = 150;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, builderChild) => SlideTransition(
        position: _animationController.drive(
          Animatable<Offset>.fromCallback(
            (value) => Offset(_animationController.value - 1, 0),
          ),
        ),
        child: builderChild,
      ),
      child: GridView(
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
            MealCategoryItem(
              category: cat,
            )
        ],
      ),
    );
  }
}
