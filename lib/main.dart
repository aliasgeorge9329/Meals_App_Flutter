import 'package:flutter/material.dart';
import 'package:meals_app/data/meals_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    '_glutenFree': false,
    '_vegetarian': false,
    '_vegan': false,
    '_lactoseFree': false,
  };

  List<Meal> availableMeals = dUMMYMEALS;
  List<Meal> favouriteMeals = [];

  void addFavouriteMeals(Meal meal) {
    setState(() {
      if (favouriteMeals.contains(meal)) {
        favouriteMeals.remove(meal);
      } else {
        favouriteMeals.add(meal);
      }
    });
  }

  void setFilters(Map<String, bool> filters_) {
    setState(() {
      filters['_glutenFree'] = filters_['_glutenFree'] as bool;
      filters['_vegetarian'] = filters_['_vegetarian'] as bool;
      filters['_vegan'] = filters_['_vegan'] as bool;
      filters['_lactoseFree'] = filters_['_lactoseFree'] as bool;
      availableMeals = dUMMYMEALS.where((meal) {
        if (!meal.isGlutenFree && (filters['_glutenFree'] as bool)) {
          return false;
        }
        if (!meal.isVegetarian && (filters['_vegetarian'] as bool)) {
          return false;
        }
        if (!meal.isVegan && (filters['_vegan'] as bool)) {
          return false;
        }
        if (!meal.isLactoseFree && (filters['_lactoseFree'] as bool)) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favouriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals),
        MealDetailPage.routName: (context) =>
            MealDetailPage(addFavouriteMeals, favouriteMeals),
        FiltersScreen.routName: (context) => FiltersScreen(setFilters, filters),
      },
    );
  }
}
