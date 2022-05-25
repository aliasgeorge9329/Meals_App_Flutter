import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import '../models/category.dart';
import '../data/category_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...dUMMYCATEGORIES.map((category) {
            return CategoryItem(
                title: category.title, color: category.color, id: category.id);
          }).toList()
        ],
      ),
    );
  }
}
