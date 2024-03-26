import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/widgets/left_menu.dart';
import 'package:meal_app/screens/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final firstTabName = "Categories";
  final secondTabName = "Favorites";
  String appBarTitle = "Categories";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: TabBar(
            dividerHeight: 0,
            tabAlignment: TabAlignment.fill,
            tabs: [
              Tab(
                text: firstTabName,
                icon: const Icon(
                  Icons.set_meal,
                ),
              ),
              Tab(
                text: secondTabName,
                icon: const Icon(
                  Icons.star,
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            appBarTitle,
          ),
        ),
        drawer: const LeftMenu(),
        body: Builder(builder: (context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              setState(() {
                appBarTitle = switch (tabController.index) {
                  0 => firstTabName,
                  1 => secondTabName,
                  _ => ""
                };
              });
            }
          });
          return const TabBarView(children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ]);
        }),
      ),
    );
  }
}
