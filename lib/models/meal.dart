import 'package:flutter/foundation.dart';

enum Affordability {
  Affordable,
  Luxurious,
  Pricey,
}

enum Complexity { Simple, Challenging, Hard }

class Meal {
  final String id;
  final List<String> categories;
  final String title;

  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;

  final List<String> ingredients;
  final List<String> steps;

  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  String get complexityText {
    return this.complexity == Complexity.Simple ? 'Simple': this.complexity == Complexity.Challenging ? 'Challenging': 'Hard';
  }
  String get affordabilityText {
    return this.affordability == Affordability.Affordable ? 'Affordable': this.affordability == Affordability.Luxurious ? 'Luxurious': 'Pricey';

  }

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.imageUrl,
    @required this.duration,
    @required this.ingredients,
    @required this.steps,
    @required this.isGlutenFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isLactoseFree,
  });
}
