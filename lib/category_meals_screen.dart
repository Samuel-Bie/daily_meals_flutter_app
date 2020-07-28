import 'package:flutter/material.dart';

import 'models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final Category category;
  // const CategoryMealsScreen( this.category,{Key key}) : super(key: key);

  static const routeName = '/category-meals';


  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs.title),
      ),
      body: Center(
        child: Text('Receitas'),
      ),
    );
  }
}
