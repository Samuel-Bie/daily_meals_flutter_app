import 'package:flutter/material.dart';

import 'package:daily_meals/data/dummy_data.dart';
import 'package:daily_meals/widgets/category_item_widget.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: <Widget>[
        ...DUMMY_CATEGORIES.map((e) {
          return CategoryItem(
            category: e,
          );
        }).toList()
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
