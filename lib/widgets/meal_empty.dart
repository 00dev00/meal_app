import 'package:flutter/material.dart';

class MealEmptyScreen extends StatelessWidget {
  const MealEmptyScreen({
    super.key,
    this.supplementaryText,
  });

  final String? supplementaryText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              "Uh oh ... nothing here!",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white70),
            ),
          ),
          Text(
            supplementaryText ?? "Try selecting a different category!",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
