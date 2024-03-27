import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_filters.dart';
import 'package:provider/provider.dart';

class MealFiltersScreen extends StatelessWidget {
  const MealFiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MealFiltersProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: ListView(
        children: [
          for (MapEntry<MealFilter, ({String name, String desc})> filterDesc
              in provider.extendedDesc.entries)
            SwitchListTile.adaptive(
              value: provider.getFilter(filterDesc.key),
              onChanged: (value) => provider.changeFilter(filterDesc.key),
              title: Text(filterDesc.value.name),
              subtitle: Text(filterDesc.value.desc),
            )
        ],
      ),
    );
  }
}
