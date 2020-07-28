import 'package:daily_meals/screens/meal_details_screem.dart';
import 'package:flutter/material.dart';

import 'package:daily_meals/screens/categories_screen.dart';
import 'package:daily_meals/screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              subtitle1: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              subtitle2: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // MaterialPageRoute(builder: (ctx)=> CategoryMealsScreen());
      },
      onUnknownRoute: (settings) {
        MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      },
    );
  }
}
