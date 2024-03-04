import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealImage extends StatelessWidget {
  const MealImage(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: meal.imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator.adaptive(
        value: downloadProgress.progress,
      ),
      errorWidget: (context, url, error) => Image.asset(
        width: double.infinity,
        fit: BoxFit.cover,
        "assets/images/no_meal.png",
      ),
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }
}
