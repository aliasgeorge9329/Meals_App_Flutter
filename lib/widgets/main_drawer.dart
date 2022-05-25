import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            )),
        SizedBox(
          height: 20,
        ),
        ListTile(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
          leading: const Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: const Text(
            'Meals',
            style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routName);
          },
          leading: const Icon(
            Icons.settings,
            size: 26,
          ),
          title: const Text(
            'Filters',
            style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
