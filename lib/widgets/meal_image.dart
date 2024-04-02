import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal/meal.dart';

class MealImage extends StatelessWidget {
  const MealImage(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: meal.imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => FittedBox(
        child: CircularProgressIndicator.adaptive(
          value: downloadProgress.progress,
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
        "assets/images/no_meal.png",
      ),
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
