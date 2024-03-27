import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_filters.dart';
import 'package:meal_app/screens/meal_all.dart';

class LeftMenu extends StatelessWidget {
  const LeftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var itemTheme = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.white60,
        );

    return SafeArea(
      child: NavigationDrawer(
        selectedIndex: -1,
        onDestinationSelected: (index) {
          Scaffold.of(context).closeDrawer();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => index == 0
                  ? const AllMealsScreen()
                  : const MealFiltersScreen(),
            ),
          );
        },
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.onPrimary,
              ],
            )),
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
      ),
    );
  }
}
