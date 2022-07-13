import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:meal_app_flutter/categories_screen.dart';
import 'package:meal_app_flutter/category_meal_screen.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      initialRoute: CategoriesScreen.id,
      routes: {
        CategoriesScreen.id: (context) => CategoriesScreen(),
        CategoryMealScreen.id: (context) => CategoryMealScreen(),
      },
    );
  }
}
