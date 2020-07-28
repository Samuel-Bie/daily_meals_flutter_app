import 'package:flutter/material.dart';

import 'package:daily_meals/data/dummy_data.dart';
import 'package:daily_meals/widgets/meal_item.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Category;
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeArgs.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: meals[index]);
        },
        itemCount: meals.length,
      ),
    );
  }
}
