import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:meal_app_flutter/categories_screen.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealApp',
      theme: ThemeData(primarySwatch: Colors.blue
      ),
      home: CategoriesScreen(),
    );
  }
}
