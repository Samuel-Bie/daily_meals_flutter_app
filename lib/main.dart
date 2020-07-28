import 'package:daily_meals/screens/filters_screen.dart';
import 'package:daily_meals/screens/meal_details_screem.dart';
import 'package:daily_meals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'package:daily_meals/data/dummy_data.dart';

import 'package:daily_meals/screens/category_meals_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': true,
    'vegan': true,
    'vegetarian': true,
    'lactose': true,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favorites = [];

  void _updateFilters(Map<String, bool> newFilters) {
    print(newFilters);
    setState(() {
      _filters = newFilters;

      availableMeals = DUMMY_MEALS.where((meal) {
        return meal.isGlutenFree == _filters['gluten'] &&
            meal.isVegan == _filters['vegan'] &&
            meal.isVegetarian == _filters['vegetarian'] &&
            meal.isLactoseFree == _filters['lactose'];
      }).toList();
    });
  }

  void _toogleFavoriteMeal(Meal meal) {
    if (favorites.contains(meal))
      setState(() {
        favorites.remove(meal);
      });
    else
      setState(() {
        favorites.add(meal);
      });
  }

  bool _isMealFavorite(Meal meal) {
    return favorites.contains(meal);
  }

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
              headline1: TextStyle(
                fontSize: 30,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w900,
                color: Colors.pink,
              ),
              headline2: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => TabsScreen(favorites),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(
            toogleFavoriteMeal: _toogleFavoriteMeal,
            isMealFavorite: _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              updateFilters: _updateFilters,
              currentFilters: _filters,
            ),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // MaterialPageRoute(builder: (ctx)=> CategoryMealsScreen());
      },
      onUnknownRoute: (settings) {
        MaterialPageRoute(
            builder: (ctx) => CategoryMealsScreen(availableMeals));
      },
    );
  }
}
