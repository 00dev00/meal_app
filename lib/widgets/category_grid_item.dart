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
    return Container(
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
            Radius.circular(10),
          )),
      child: Center(
        child: Text(
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
          category.title,
        ),
      ),
    );
  }
}
