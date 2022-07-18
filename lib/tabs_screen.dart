import 'package:flutter/material.dart';
import 'package:meal_app_flutter/categories_screen.dart';
import 'package:meal_app_flutter/favorites_screen.dart';
import 'package:meal_app_flutter/main_drawer.dart';
import 'package:meal_app_flutter/meal.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'tabs_screen';

  final List<dynamic> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState(){
    _pages = [
      { 'pages': CategoriesScreen(), 'title': 'Categories',},
      { 'pages': FavoritesScreen(widget.favoriteMeals), 'title': 'Favorites',},
    ];
    super.initState();
  }




  void _selectPage(int index){
    setState((){
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['pages'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.limeAccent,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
