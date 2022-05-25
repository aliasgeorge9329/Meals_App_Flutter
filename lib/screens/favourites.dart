import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favouriteMeals;
  Favourites(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(favouriteMeals[index]);
        },
        itemCount: favouriteMeals.length,
      ),
    );
  }
}
