import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {

  static const String id = 'categoryMeal_screen';

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: Center(
        child: Text(
          'The Recipes For The Category',
        ),
      ),
    );
  }
}
