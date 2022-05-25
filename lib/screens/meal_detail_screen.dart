import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailPage extends StatelessWidget {
  static const routName = '/meal-detail';

  final List<Meal> favouriteMeals;
  final Function addFavouriteMeals;
  MealDetailPage(this.addFavouriteMeals, this.favouriteMeals);

  Widget Ingredients(BuildContext context, Meal meal) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Ingredients',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          height: 200,
          width: 300,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index])),
                ),
              );
            },
            itemCount: meal.ingredients.length,
          ),
        )
      ],
    );
  }

  Widget Steps(BuildContext context, List<String> steps) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)),
      height: 200,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('#${index + 1}'),
                  ),
                  title: Text(steps[index]),
                ),
                Divider(),
              ],
            );
          },
          itemCount: steps.length),
    );
  }

  bool checkFavourite(Meal meal) {
    if (favouriteMeals.contains(meal)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                  )),
              Ingredients(context, meal),
              Steps(context, meal.steps),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFavouriteMeals(meal);
        },
        child: Icon(
          checkFavourite(meal) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
