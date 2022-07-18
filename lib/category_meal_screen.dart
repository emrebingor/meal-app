import 'package:flutter/material.dart';
import 'package:meal_app_flutter/meal_item.dart';
import 'package:meal_app_flutter/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String id = 'categoryMeal_screen';

  final List<dynamic> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String? categoryTitle;
  late List<dynamic> displayedMeals;

  @override
  void didChangeDependencies(){
    final routeArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }


  void _removeMeal(String mealId){
    setState((){
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}



