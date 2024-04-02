import 'package:meal_app/models/meal/meal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal_favorites.g.dart';

@Riverpod(keepAlive: true)
final class MealFavorites extends _$MealFavorites {
  @override
  List<Meal> build() {
    return <Meal>[];
  }

  void addMeal(Meal newMeal) {
    bool alreadyExist = state.any((Meal meal) => meal.id == newMeal.id);

    if (!alreadyExist) {
      state = [...state, newMeal];
    }
  }

  void removeMeal(Meal mealToRemove) {
    state = state.where((Meal meal) => meal.id != mealToRemove.id).toList();
  }
}
