import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/meal_favorites.dart';
import 'package:meal_app/widgets/meal_image.dart';
import 'package:provider/provider.dart';

class MealItemDetails extends StatefulWidget {
  final Meal meal;

  const MealItemDetails(
    this.meal, {
    super.key,
  });

  @override
  State<MealItemDetails> createState() => _MealItemDetailsState();
}

class _MealItemDetailsState extends State<MealItemDetails> {
  @override
  Widget build(BuildContext context) {
    const headingTextStyle = TextStyle(
      fontSize: 20,
      color: Colors.deepOrangeAccent,
    );

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Row(
            children: [
              Text(
                widget.meal.title,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListenableBuilder(
                  listenable: context.read<FavoriteMealProvider>(),
                  builder: (context, child) => GestureDetector(
                    onTap: () => _toggleFavorite(
                      context,
                      widget.meal,
                    ),
                    child: _getFavoriteIcon(
                      context,
                      widget.meal,
                    ),
                  ),
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
                  widget.meal,
                ),
              ),
            ),
            const Text(
              "Ingredients",
              style: headingTextStyle,
            ),
            _getIngredientsList(context),
            const Text(
              "Steps",
              style: headingTextStyle,
            ),
            _getStepsList(context)
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

  Icon _getFavoriteIcon(BuildContext context, Meal meal) {
    var isFavorite = context.read<FavoriteMealProvider>().isFavoriteMeal(meal);

    return isFavorite
        ? const Icon(Icons.star)
        : const Icon(Icons.star_border_outlined);
  }

  Widget _getStepsList(BuildContext context) {
    return _getDetailsText(widget.meal.steps, context);
  }

  Widget _getIngredientsList(BuildContext context) {
    return _getDetailsText(widget.meal.ingredients, context);
  }

  void _toggleFavorite(BuildContext context, Meal meal) {
    var favoriteMealProvider = context.read<FavoriteMealProvider>();
    var isFavorite = favoriteMealProvider.isFavoriteMeal(meal);
    SnackBar snackBar;

    if (isFavorite) {
      favoriteMealProvider.removeMeal(meal);
      snackBar = const SnackBar(content: Text("Removed from favorites"));
    } else {
      favoriteMealProvider.addMeal(meal);
      snackBar = const SnackBar(content: Text("Marked as favorite"));
    }

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
