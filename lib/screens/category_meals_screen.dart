import 'package:daily_meals/models/meal.dart';
import 'package:flutter/material.dart';

import 'package:daily_meals/data/dummy_data.dart';
import 'package:daily_meals/widgets/meal_item.dart';

import '../models/category.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category category;
  List<Meal> listOfMeals;
  bool _loadInital = false;

  @override
  void initState() {
    super.initState();
  }

  void _removeMeal(Meal meal) {
    setState(() {
      listOfMeals.remove(meal);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadInital) {
      category = ModalRoute.of(context).settings.arguments as Category;
      listOfMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(category.id);
      }).toList();
      _loadInital = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              meal: listOfMeals[index], deleteFunction: _removeMeal);
        },
        itemCount: listOfMeals.length,
      ),
    );
  }
}
