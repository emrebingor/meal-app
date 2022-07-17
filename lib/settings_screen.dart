import 'package:flutter/material.dart';
import 'package:meal_app_flutter/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                FilterListTile(
                  title: 'Gluten Free',
                  subtitle: 'Only gluten free',
                  value: _glutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                FilterListTile(
                  title: 'Lactose Free',
                  subtitle: 'Only Lactose free',
                  value: _lactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                FilterListTile(
                  title: 'Vegan',
                  subtitle: 'Only vegan',
                  value: _vegan,
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                FilterListTile(
                  title: 'Vegetarian',
                  subtitle: 'Only vegetarian',
                  value: _vegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final dynamic? onChanged;

  FilterListTile(
      {required this.title,
      required this.subtitle,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      activeColor: Colors.deepPurple,
      value: value,
      subtitle: Text(subtitle),
      onChanged: onChanged,
    );
  }
}
