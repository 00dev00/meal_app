import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal/meal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal_main.g.dart';

@riverpod
class MealMain extends _$MealMain {
  @override
  List<Meal> build() {
    return dummyMeals;
  }
}
