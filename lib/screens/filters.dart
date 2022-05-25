import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = '/filters';
  final Function setFilters;
  Map<String, bool> currentFilters;
  FiltersScreen(this.setFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['_glutenFree'] as bool;
    _lactoseFree = widget.currentFilters['_lactoseFree'] as bool;
    _vegetarian = widget.currentFilters['_vegetarian'] as bool;
    _vegan = widget.currentFilters['_vegan'] as bool;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MainDrawer(),
      ),
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              widget.setFilters({
                '_glutenFree': _glutenFree,
                '_vegetarian': _vegetarian,
                '_vegan': _vegan,
                '_lactoseFree': _lactoseFree,
              });
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: _glutenFree,
                title: Text('Gluten-Free'),
                subtitle: Text('Only include gluten-free meals.'),
                onChanged: (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
              ),
              SwitchListTile(
                value: _lactoseFree,
                title: Text('Lactose-Free'),
                subtitle: Text('Only include lactose-free meals.'),
                onChanged: (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                },
              ),
              SwitchListTile(
                value: _vegetarian,
                title: Text('Vegetarian'),
                subtitle: Text('Only include vegetarian meals.'),
                onChanged: (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                },
              ),
              SwitchListTile(
                value: _vegan,
                title: Text('Vegan'),
                subtitle: Text('Only include vegan meals.'),
                onChanged: (value) {
                  setState(() {
                    _vegan = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
