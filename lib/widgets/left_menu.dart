import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/all_meals_screen.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var itemTheme = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.white60,
        );

    return NavigationDrawer(
      selectedIndex: -1,
      tilePadding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      onDestinationSelected: (index) {
        Scaffold.of(context).closeDrawer();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                index == 0 ? const AllMealsScreen() : const FiltersScreen(),
          ),
        );
      },
      children: [
        DrawerHeader(
          child: Center(
            child: ListTile(
              title: Text(
                "Cooking Up!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white60,
                    ),
              ),
              leading: const Icon(
                Icons.fastfood,
                size: 42,
              ),
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.restaurant),
          label: Text(
            "Meals",
            style: itemTheme,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.settings),
          label: Text("Filters", style: itemTheme),
        ),
      ],
    );
  }
}
