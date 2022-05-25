import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/favourites.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> listWidgets = [];

  int pageSelected = 0;

  void selectPage(index) {
    setState(() {
      pageSelected = index;
    });
  }

  @override
  void initState() {
    listWidgets = [
      {'title': "Categories", 'page': CategoriesScreen()},
      {'title': "Your Favourites", 'page': Favourites(widget.favouriteMeals)},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          listWidgets[pageSelected]['title'] as String,
        ),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: listWidgets[pageSelected]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.shifting,
        currentIndex: pageSelected,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favourites',
          )
        ],
      ),
    );
  }
}
