import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_data.dart';
import './categories_screen.dart';

class CategoriesMealsScreen extends StatefulWidget {
  // final String catergoryId;
  // final String categoryTitle;

  // CategoriesMealsScreen(this.catergoryId,this.categoryTitle);
  final List<Meal> _availableMeals;

  CategoriesMealsScreen(this._availableMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String title;
  List<Meal> displayedMeals;
  var check = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!check) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      final id = routeArgs['id'];
      displayedMeals = widget._availableMeals
          .where((element) => element.categories.contains(id))
          .toList();
      check = true;
    }

    super.didChangeDependencies();
  }

  void _remove(String mid) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            final cat = displayedMeals[index];
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
          itemCount: displayedMeals.length,
        ));
  }
}
