import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function isFavorite;

  MealScreen(this.toggleFavorite, this.isFavorite);

  static const routeName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeArgs['id'];
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: Text(
            '${meal.title}',
            style: TextStyle(),
            overflow: TextOverflow.fade,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              child: Container(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
                color: Colors.purple[100],
              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    width: 500,
                    height: 40,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${index + 1})   ${meal.ingredients[index]}',
                        ),
                      ),
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Steps',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoCondensed'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
                color: Colors.green[100],
              ),
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.pink[400],
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(color: Colors.pink[50]),
                          ),
                        ),
                        title: Container(
                          child: Text('${meal.steps[index]}'),
                        ),
                      ),
                      Divider(
                        color: Colors.pink[500],
                      )
                    ],
                  );
                },
                itemCount: meal.steps.length,
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon(
          isFavorite(id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          toggleFavorite(id);
        },
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
