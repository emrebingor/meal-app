import 'package:flutter/material.dart';
import 'package:meal_app_flutter/dummy_data.dart';
import 'package:meal_app_flutter/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  static const String id = 'categories_screen';

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(20.0),
        children: Dummy_Categories.map(
          (catData) => CategoryItem(
            catData.id,
            catData.title,
            catData.color,
          ),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      );
  }
}
