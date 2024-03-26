import 'package:flutter/material.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<FiltersProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: ListenableBuilder(
        listenable: provider,
        builder: (BuildContext context, Widget? child) => ListView(
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
      ),
    );
  }
}
