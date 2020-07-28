import 'package:daily_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import 'package:daily_meals/models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favorites;

  Function toogleFavorite;

  FavoritesScreen(this.favorites, {Key key}) : super(key: key);
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return this.widget.favorites.isEmpty
        ? Center(
            child: Text('There are no favorites'),
          )
        : _buildFavoriteList(context);
  }

  Widget _buildFavoriteList(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          meal: this.widget.favorites[index],
        );
      },
      itemCount: this.widget.favorites.length,
    );
  }
}
