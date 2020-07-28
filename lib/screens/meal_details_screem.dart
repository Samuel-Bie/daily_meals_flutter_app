import 'package:daily_meals/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal';

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body:  Text(meal.title),
    );
  }
}
