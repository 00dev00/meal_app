import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';

enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

@freezed
class Meal with _$Meal {
  const factory Meal({
    required String id,
    required List<String> categories,
    required String title,
    required String imageUrl,
    required List<String> ingredients,
    required List<String> steps,
    required int duration,
    required Complexity complexity,
    required Affordability affordability,
    required bool isGlutenFree,
    required bool isLactoseFree,
    required bool isVegan,
    required bool isVegetarian,
  }) = _Meal;
}
