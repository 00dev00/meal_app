import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_categories.dart';
import 'package:meal_app/screens/meal_favorites.dart';
import 'package:meal_app/widgets/left_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;
  var appBarTitle = "Categories";

  final destinations = const [
    NavigationDestination(
      icon: Icon(Icons.set_meal),
      label: "Categories",
      selectedIcon: Icon(Icons.set_meal_outlined),
    ),
    NavigationDestination(
      icon: Icon(Icons.star),
      label: "Favorites",
      selectedIcon: Icon(Icons.star_outlined),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          destinations: destinations,
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
              appBarTitle = index == 0 ? "Categories" : "Your Favorites";
            });
          }),
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      drawer: const LeftMenu(),
      body: currentIndex == 0
          ? const MealCategoriesScreen()
          : const MealFavoritesScreen(),
    );
  }
}
