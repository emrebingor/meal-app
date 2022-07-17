import 'package:flutter/material.dart';
import 'package:meal_app_flutter/dummy_data.dart';
import 'package:meal_app_flutter/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String id = 'meal_detail_screen';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = Dummy_Meals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            BuildTitle('Ingredients'),
            BuildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            BuildTitle('Steps'),
            BuildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '${index + 1}',
                        ),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context, mealId);
        },
      ),
    );
  }
}

class BuildTitle extends StatelessWidget {
  final String title;

  BuildTitle(@required this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'RobotCondensed',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BuildContainer extends StatelessWidget {
  final Widget child;

  BuildContainer(@required this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      height: 250,
      width: 350,
      child: child,
    );
  }
}
