import 'package:daily_meals/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Ola Sam!',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(height: 20),
          buildListTile(
            context,
            'Meals',
            Icon(Icons.restaurant, size: 26),
            () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          SizedBox(height: 20),
          buildListTile(
            context,
            'Filters',
            Icon(Icons.settings, size: 26),
            () {
              Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(
      BuildContext context, String text, Icon icon, Function handler) {
    return ListTile(
      onTap: handler,
      leading: icon,
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
