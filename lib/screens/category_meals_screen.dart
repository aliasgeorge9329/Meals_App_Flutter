import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  static const routeName = '/category-meals';
  final List<Meal> MEALS;
  CategoryMealsScreen(this.MEALS);

  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    List<Meal> getMeals() {
      return MEALS
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
    }

    return Scaffold(
        appBar: AppBar(title: Text('${categoryTitle}')),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(getMeals()[index]);
          },
          itemCount: getMeals().length,
        ));
  }
}
