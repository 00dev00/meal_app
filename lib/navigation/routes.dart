import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/screens/home.dart';
import 'package:meal_app/screens/meal_all.dart';
import 'package:meal_app/screens/meal_by_category.dart';
import 'package:meal_app/screens/meal_categories.dart';
import 'package:meal_app/screens/meal_details.dart';
import 'package:meal_app/screens/meal_favorites.dart';
import 'package:meal_app/screens/meal_filters.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRoute mealDetails = GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: 'details/:meal_id',
    builder: (context, state) {
      final mealId = state.pathParameters['meal_id'] as String;
      return MealDetailsScreen(mealId);
    });

final List<RouteBase> appRoutes = [
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const MealCategoriesScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: "meals",
            builder: (context, state) => const AllMealsScreen(),
            routes: [mealDetails],
          ),
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: "filters",
            builder: (context, state) => const MealFiltersScreen(),
          ),
          GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: "meals_by_category/:category_id",
              builder: (context, state) {
                final categoryId =
                    state.pathParameters["category_id"] as String;
                return MealsByCategoryScreen(categoryId: categoryId);
              },
              routes: [mealDetails]),
        ],
      ),
      GoRoute(
          path: "/favorites",
          builder: (context, state) {
            return const MealFavoritesScreen();
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: 'details/:meal_id',
              builder: (context, state) {
                String mealId = state.pathParameters["meal_id"] as String;
                return MealDetailsScreen(mealId);
              },
            ),
          ]),
      GoRoute(
        path: "/categories",
        redirect: (context, state) => "/",
      )
    ],
    builder: (context, state, child) => HomeScreen(
      child: child,
    ),
  ),
];

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: "/",
  routes: appRoutes,
);
