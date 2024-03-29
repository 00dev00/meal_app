import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/meal_favorites.dart';
import 'package:meal_app/providers/meal_filters.dart';
import 'package:meal_app/services/meal_service.dart';
import 'package:meal_app/widgets/meal_image.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatefulWidget {
  final String mealId;

  const MealDetailsScreen(
    this.mealId, {
    super.key,
  });

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var filtersProvider = context.read<MealFiltersProvider>();
    var meal = MealService(filtersProvider).getMeal(widget.mealId);

    const headingTextStyle = TextStyle(
      fontSize: 20,
      color: Colors.deepOrangeAccent,
    );

    var provider = context.watch<MealFavoritesProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            onPressed: () => _toggleFavorite(
              provider,
              meal,
            ),
            icon: _getFavoriteIcon(
              provider,
              meal,
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
                child: MealImage(
                  meal,
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

  Icon _getFavoriteIcon(MealFavoritesProvider provider, Meal meal) {
    var isFavorite = provider.isFavoriteMeal(meal);

    return isFavorite
        ? const Icon(Icons.star)
        : const Icon(Icons.star_border_outlined);
  }

  Widget _getStepsList(BuildContext context, Meal meal) {
    return _getDetailsText(meal.steps, context);
  }

  Widget _getIngredientsList(BuildContext context, Meal meal) {
    return _getDetailsText(meal.ingredients, context);
  }

  void _toggleFavorite(MealFavoritesProvider provider, Meal meal) {
    var isFavorite = provider.isFavoriteMeal(meal);
    SnackBar snackBar;

    if (isFavorite) {
      provider.removeMeal(meal);
      snackBar = const SnackBar(content: Text("Removed from favorites"));
    } else {
      provider.addMeal(meal);
      snackBar = const SnackBar(content: Text("Marked as favorite"));
    }

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
