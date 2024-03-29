import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/widgets/left_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<String> appBarTitleListenable =
      ValueNotifier<String>("Categories");

  final ValueNotifier<int> currentIndexListenbable = ValueNotifier<int>(0);

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
          selectedIndex: currentIndexListenbable.value,
          onDestinationSelected: (index) {
            currentIndexListenbable.value = index;

            if (index == 0) {
              appBarTitleListenable.value = "Categories";
              context.go("/categories");
            } else {
              appBarTitleListenable.value = "Your Favorites";
              context.go("/favorites");
            }
          }),
      appBar: AppBar(
        title: Text(
          appBarTitleListenable.value,
        ),
      ),
      drawer: const LeftMenu(),
      body: widget.child,
    );
  }
}
