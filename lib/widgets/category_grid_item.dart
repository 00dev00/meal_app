import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    required this.category,
    super.key,
  });
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      splashColor: Theme.of(context).primaryColorDark,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            )),
        child: Center(
          child: Text(
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
            category.title,
          ),
        ),
      ),
    );
  }
}
