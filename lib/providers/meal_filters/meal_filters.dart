import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal_filters.g.dart';

@Riverpod(keepAlive: true)
final class MealFilters extends _$MealFilters {
  @override
  Map<MealFilter, bool> build() {
    return Map.fromIterables(MealFilter.values,
        List<bool>.generate(MealFilter.values.length, (index) => false));
  }

  changeFilter(MealFilter filter) {
    switch (filter) {
      case MealFilter.isGlutenFree:
        state[MealFilter.isGlutenFree] = !(state[MealFilter.isGlutenFree]!);
        break;
      case MealFilter.isLactoseFree:
        state[MealFilter.isLactoseFree] = !(state[MealFilter.isLactoseFree]!);
        break;
      case MealFilter.isVegetarian:
        state[MealFilter.isVegetarian] = !(state[MealFilter.isVegetarian]!);
        break;
      case MealFilter.isVegan:
        state[MealFilter.isVegan] = !(state[MealFilter.isVegan]!);
        break;
    }
    state = Map<MealFilter, bool>.of(state); // keep immutability
  }
}

@Riverpod(keepAlive: true)
Map<MealFilter, ({String desc, String name})> mealFiltersExtendedDesc(
    MealFiltersExtendedDescRef ref) {
  return {
    for (final filter in MealFilter.values)
      filter: switch (filter) {
        MealFilter.isGlutenFree => (
            name: "Gluten-free",
            desc: "Only include gluten-free meals."
          ),
        MealFilter.isLactoseFree => (
            name: "Lactose-free",
            desc: "Only include lactose-free meals."
          ),
        MealFilter.isVegan => (
            name: "Vegan",
            desc: "Only include vegan meals.",
          ),
        MealFilter.isVegetarian => (
            name: "Vegetarian",
            desc: "Only include vegetarian meals.",
          ),
      }
  };
}

enum MealFilter {
  isGlutenFree,
  isLactoseFree,
  isVegetarian,
  isVegan,
}
