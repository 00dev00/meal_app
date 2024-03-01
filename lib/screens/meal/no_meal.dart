import 'package:flutter/material.dart';

class NoMeal extends StatelessWidget {
  const NoMeal({
    super.key,
  });

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
            "Try selecting a different category!",
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
