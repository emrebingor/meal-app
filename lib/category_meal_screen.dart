import 'package:flutter/material.dart';
import 'package:meal_app_flutter/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String id = 'categoryMeal_screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal = Dummy_Meals.where((meal) {return meal.categories.contains(categoryId);}).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Text(categoryMeal[index].title);
      }, itemCount: categoryMeal.length,),
    );
  }
}
