import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_data.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('No favorites yet! Please add some.'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final cat = favoriteMeals[index];
          return MealItem(
            id: cat.id,
            title: cat.title,
            duration: cat.duration,
            imageUrl: cat.imageUrl,
            affordability: cat.affordability,
            complexity: cat.complexity,
            ingredients: cat.ingredients,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
