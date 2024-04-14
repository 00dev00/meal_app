import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meal/meal_main.dart';
import 'package:meal_app/models/meal/meal.dart';
import 'package:meal_app/providers/meal_favorites/meal_favorites.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:meal_app/widgets/meal_image.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  final String mealId;

  const MealDetailsScreen(
    this.mealId, {
    super.key,
  });

  @override
  ConsumerState<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends ConsumerState<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealMainProvider);
    final favorites = ref.watch(mealFavoritesProvider);
    final mealService = MealService(
      meals: meals,
      favorites: favorites,
    );
    final meal = mealService.getMeal(widget.mealId);

    final isFavorite = mealService.isFavoriteMeal(meal.id);

    const headingTextStyle = TextStyle(
      fontSize: 20,
      color: Colors.deepOrangeAccent,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () => _toggleFavorite(isFavorite, meal),
            icon: AnimatedSwitcher(
              duration: Durations.long1,
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: isFavorite
                  ? const Icon(
                      Icons.star,
                      key: ValueKey("favorite"),
                    )
                  : const Icon(
                      Icons.star_border_outlined,
                      key: ValueKey("not_favorite"),
                    ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: Hero(
                  tag: meal.id,
                  child: MealImage(
                    meal,
                  ),
                ),
              ),
            ),
            const Text(
              "Ingredients",
              style: headingTextStyle,
            ),
            _getIngredientsList(context, meal),
            const Text(
              "Steps",
              style: headingTextStyle,
            ),
            _getStepsList(context, meal)
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

  Widget _getStepsList(BuildContext context, Meal meal) {
    return _getDetailsText(meal.steps, context);
  }

  Widget _getIngredientsList(BuildContext context, Meal meal) {
    return _getDetailsText(meal.ingredients, context);
  }

  void _toggleFavorite(bool isFavorite, Meal meal) {
    SnackBar snackBar;

    if (isFavorite) {
      ref.read(mealFavoritesProvider.notifier).removeMeal(meal);
      snackBar = const SnackBar(content: Text("Removed from favorites"));
    } else {
      ref.read(mealFavoritesProvider.notifier).addMeal(meal);
      snackBar = const SnackBar(content: Text("Marked as favorite"));
    }

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
