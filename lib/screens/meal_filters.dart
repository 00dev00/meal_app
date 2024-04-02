import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meal_filters/meal_filters.dart';

class MealFiltersScreen extends ConsumerStatefulWidget {
  const MealFiltersScreen({super.key});

  @override
  ConsumerState<MealFiltersScreen> createState() => _MealFiltersScreenState();
}

class _MealFiltersScreenState extends ConsumerState<MealFiltersScreen> {
  @override
  Widget build(BuildContext context) {
    final filtersExtendedDesc = ref.read(mealFiltersExtendedDescProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: ListView(
        children: [
          for (MapEntry<MealFilter, ({String name, String desc})> filterDesc
              in filtersExtendedDesc.entries)
            SwitchListTile.adaptive(
              value: ref.watch(mealFiltersProvider)[filterDesc.key]!,
              onChanged: (value) => ref
                  .read(mealFiltersProvider.notifier)
                  .changeFilter(filterDesc.key),
              title: Text(filterDesc.value.name),
              subtitle: Text(filterDesc.value.desc),
            )
        ],
      ),
    );
  }
}
