import 'package:daily_meals/screens/category_meals_screen.dart';
import 'package:daily_meals/models/category.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({Key key, @required this.category}) : super(key: key);

  void _selectCategory(BuildContext context) {
    Navigator.pushNamed(context, CategoryMealsScreen.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
            child: Text(
          category.title,
          style: Theme.of(context).textTheme.subtitle1,
        )),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [category.color.withOpacity(0.7), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
