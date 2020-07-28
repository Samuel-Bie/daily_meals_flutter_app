import 'package:flutter/material.dart';

import 'package:daily_meals/data/dummy_data.dart';
import 'package:daily_meals/widgets/meal_item.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
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
