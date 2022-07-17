import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:meal_app_flutter/dummy_data.dart';
import 'package:meal_app_flutter/categories_screen.dart';
import 'package:meal_app_flutter/category_meal_screen.dart';
import 'meal_detail_screen.dart';
import 'package:meal_app_flutter/tabs_screen.dart';
import 'package:meal_app_flutter/settings_screen.dart';
import 'package:meal_app_flutter/favorites_screen.dart';
import 'meal.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatefulWidget {


  @override
  State<MealApp> createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<dynamic> _availableMeals = Dummy_Meals;

  void _setFilters(Map<String, bool> filterData){
    setState((){
      _filters = filterData;

      _availableMeals = Dummy_Meals.where((meal){
        if ((_filters['gluten'] ?? true) && !meal.isGlutenFree){
          return false;
        }
        if ((_filters['lactose'] ?? true) && !meal.isLactoseFree){
          return false;
        }
        if ((_filters['vegan'] ?? true) && !meal.isVegan){
          return false;
        }
        if ((_filters['vegetarian'] ?? true) && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.lightGreenAccent,
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
      initialRoute: TabsScreen.id,
      routes: {
        TabsScreen.id: (context) => TabsScreen(),
        CategoryMealScreen.id: (context) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.id: (context) => MealDetailScreen(),
        SettingsScreen.id: (context) => SettingsScreen(_setFilters, _filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen(),);
      },
    );
  }
}


